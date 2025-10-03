import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/network/apiend_points.dart';
import 'package:relative_choice/core/services/chat_service/chat_service.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/core/widgets/network_image_widget.dart';
import 'package:relative_choice/features/home_feature/models/message_model.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/message_text_field.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/message_bubble_widget.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';
import '../../models/chat_room_model.dart';
import '../../models/send_message_params.dart';
import '../../providers/chat_provider/chat_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen(
      {super.key,
      required this.userId,
      this.userName = "",
      this.userImage = ""});
  final int userId;
  final String userName;
  final String userImage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool isFlagOpen = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatId =
          ref.read(chatServiceProvider).getChatId(widget.userId.toString());
      ref.read(chatServiceProvider).markMessagesAsSeen(chatId);
      ref.listenManual(chatNotifierProvider, (_, next) {
        switch (next) {
          case AsyncError error:
            Utils.showSnackBar(context, error.error.toString());
        }
      });
      ref.listenManual(
        messageListProvider(chatId),
        (_, next) {
          switch (next) {
            case AsyncData<List<MessageModel>?> data when data.value != null:
              ref.read(chatServiceProvider).markMessagesAsSeen(chatId);
            case AsyncError error:
              Utils.showSnackBar(context, error.error.toString());
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    final currentUserId = user!.user!.id.toString();
    final chatId =
        ref.read(chatServiceProvider).getChatId(widget.userId.toString());

    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.light, // Try this instead
      //     statusBarColor: Colors.transparent, // Try transparent instead
      //     systemNavigationBarColor: Color(0XFFF4FCFF),
      //     systemNavigationBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      body: SafeArea(
        child: AsyncWidget(
            value: ref.watch(messageListProvider(chatId)),
            data: (messages) {
              return AsyncWidget(
                  value:
                      ref.watch(chatRoomDataProvider(widget.userId.toString())),
                  data: (chatRoomData) {
                    return IgnorePointer(
                      ignoring: isFlagOpen,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: _ChatAppBar(
                              chatRoomState: chatRoomData,
                              currentUserId: currentUserId,
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 10),
                              physics: const AlwaysScrollableScrollPhysics(),
                              reverse: true,
                              itemBuilder: (BuildContext context, int index) {
                                final data = messages[index];
                                bool isOwnMessage =
                                    data.senderId == currentUserId;
                                return MessageBubbleWidget(
                                  onFlagPopupChanged: (val) {
                                    setState(() {
                                      isFlagOpen = val;
                                    });
                                  },
                                  key: ValueKey(data),
                                  message: data,
                                  isOwnMessage: isOwnMessage,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 10.verticalSpace;
                              },
                              itemCount: messages.length,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(0, -4),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 30, top: 10),
                              child: chatRoomData.blockingStatus.iBlockedThem
                                  ? SizedBox(
                                      width: 1.sw,
                                      height: 0.06.sh,
                                      child: const Center(
                                          child: Text("You blocked this user")))
                                  : chatRoomData.blockingStatus.theyBlockedMe
                                      ? const SizedBox.shrink()
                                      : MessageTextField(
                                          onTapOutSide: (val) {
                                            ref
                                                .read(chatNotifierProvider
                                                    .notifier)
                                                .updateUserTypingStatus(
                                                    receiverId: null);
                                          },
                                          onChanged: (val) {
                                            if (val.isNotEmpty) {
                                              ref
                                                  .read(chatNotifierProvider
                                                      .notifier)
                                                  .updateUserTypingStatus(
                                                      receiverId: widget.userId
                                                          .toString());
                                            }
                                          },
                                          controller: _messageController,
                                          onSend: () => _sendMessage(
                                              currentUserId, chatId),
                                        ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }

  void _sendMessage(String senderId, String chatId) {
    if (_messageController.text.trim().isNotEmpty) {
      final msg = _messageController.text.trim();
      final param = SendMessageParams(
          chatId: chatId,
          senderId: senderId,
          receiverId: widget.userId.toString(),
          text: msg);
      ref.read(chatNotifierProvider.notifier).sendMessage(param: param);

      _messageController.clear();
    }
  }
}

Widget _buildTodayDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFE8E6EA), thickness: 1)),
        15.horizontalSpace,
        Text(
          'Today',
          style: TextStyle(
            color: const Color(0xFF6C727F),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        15.horizontalSpace,
        const Expanded(child: Divider(color: Color(0xFFE8E6EA), thickness: 1)),
      ],
    ),
  );
}

class _ChatAppBar extends ConsumerStatefulWidget {
  const _ChatAppBar({
    required this.chatRoomState,
    required this.currentUserId,
  });
  final String currentUserId;
  final ChatRoomState chatRoomState;
  @override
  ConsumerState<_ChatAppBar> createState() => _ChatAppBarState();
}

class _ChatAppBarState extends ConsumerState<_ChatAppBar> {
  @override
  Widget build(BuildContext context) {
    final otherUser = widget.chatRoomState.otherUserModel;
    final chatRoomState = widget.chatRoomState.blockingStatus;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: const BackIcon(),
          onTap: () {
            context.pop();
          },
        ),
        20.horizontalSpace,
        SizedBox(
          height: 48.h,
          width: 48.w,
          child: ClipOval(
            child: chatRoomState.theyBlockedMe
                ? Image.asset("asset/images/photo.png")
                : NetworkImageWidget(
                    imageUrl: ApiEndPoints.imageBaseUrl + otherUser.image),
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                otherUser.name,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
              ),
              if (chatRoomState.theyBlockedMe || chatRoomState.iBlockedThem)
                ...[]
              else if (otherUser.typingTo == widget.currentUserId)
                Text(
                  'typing....',
                  style: TextStyle(
                      color: const Color(0xFF1A1819),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              else if (otherUser.isOnline == 0)
                Text(
                  'Last seen At ${otherUser.formatLastSeen}',
                  style: TextStyle(
                      color: const Color(0xFF1A1819),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              else
                Row(
                  children: [
                    Image.asset(
                      'asset/images/ellipse.png',
                      height: 6,
                      width: 6,
                    ),
                    5.horizontalSpace,
                    Text(
                      'Onilne',
                      style: TextStyle(
                          color: const Color(0xFF1A1819),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
            ],
          ),
        ),
        _PopUpMenuWidget(
            isBlocked: widget.chatRoomState.blockingStatus.iBlockedThem,
            onSelected: (action) {
              final blockUnblock =
                  widget.chatRoomState.blockingStatus.iBlockedThem;
              switch (action) {
                case ChatMenuAction.blockUnblock:
                  switch (blockUnblock) {
                    case true:
                      ref
                          .read(chatNotifierProvider.notifier)
                          .unblockUser(otherUser.id);
                      break;
                    case false:
                      ref
                          .read(chatNotifierProvider.notifier)
                          .blockUser(otherUser.id);
                      break;
                  }
                  break;
                case ChatMenuAction.search:
                  break;
                case ChatMenuAction.report:
                  break;
              }
            })
      ],
    );
  }
}

class _PopUpMenuWidget extends StatelessWidget {
  const _PopUpMenuWidget({required this.onSelected, this.isBlocked = false});
  final void Function(ChatMenuAction)? onSelected;
  final bool isBlocked;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ChatMenuAction>(
      onSelected: onSelected,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: ChatMenuAction.blockUnblock,
          child: Text(
            isBlocked ? 'Unblock' : 'Block',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ),
        const PopupMenuItem(
          value: ChatMenuAction.search,
          child: Text(
            'Search in chat',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ),
        const PopupMenuItem(
          value: ChatMenuAction.report,
          child: Text(
            'Report user',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ),
      ],
      icon: Image.asset(
        'asset/images/menu1.png',
        height: 42,
        width: 42,
      ),
    );
  }
}
