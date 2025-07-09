import 'package:flutter/material.dart';
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
import 'package:relative_choice/features/home_feature/models/user_data_model.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/message_text_field.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/message_widget.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';
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

  final ScrollController _chatScrollController = ScrollController();

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
    });
  }

  @override
  void dispose() {
    _chatScrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    final currentUserId = user!.user!.id.toString();
    final chatId =
        ref.read(chatServiceProvider).getChatId(widget.userId.toString());
    final messageData = ref.watch(messageListProvider(chatId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_chatScrollController.hasClients) {
        _chatScrollController.animateTo(
          _chatScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
    ref.listen(
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
    return Scaffold(
      body: AsyncWidget(
          value: messageData,
          data: (messages) {
            return AsyncWidget(
                value: ref.watch(otherUserProvider(widget.userId.toString())),
                data: (userData) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 0.008.sh,
                    ),
                    child: CustomScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: _chatScrollController,
                      slivers: [
                        _ChatAppBar(
                          user: userData,
                          currentUserId: currentUserId,
                        ),
                        SliverList.separated(
                          itemBuilder: (BuildContext context, int index) {
                            final data = messages[index];
                            bool isOwnMessage = data.senderId == currentUserId;
                            return MessageBubbleWidget(
                              key: ValueKey(data),
                              message: data,
                              isOwnMessage: isOwnMessage,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 10.verticalSpace;
                          },
                          itemCount: messages.length,
                        ),
                      ],
                    ),
                  );
                });
          }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: const Offset(0, -4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 10),
          child: MessageTextField(
            onChanged: (val) {
              if (val.isNotEmpty) {
                ref.read(chatNotifierProvider.notifier).updateUserTypingStatus(
                    receiverId: widget.userId.toString());
              }
            },
            controller: _messageController,
            onSend: () => _sendMessage(currentUserId, chatId),
          ),
        ),
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
        Expanded(child: Divider(color: Color(0xFFE8E6EA), thickness: 1)),
        15.horizontalSpace,
        Text(
          'Today',
          style: TextStyle(
            color: Color(0xFF6C727F),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        15.horizontalSpace,
        Expanded(child: Divider(color: Color(0xFFE8E6EA), thickness: 1)),
      ],
    ),
  );
}

class _ChatAppBar extends StatelessWidget {
  const _ChatAppBar({
    required this.user,
    required this.currentUserId,
  });
  final UserDataModel user;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      expandedHeight: 65.h,
      collapsedHeight: 65.h,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                InkWell(
                  child: BackIcon(),
                  onTap: () {
                    context.pop();
                  },
                ),
                20.horizontalSpace,
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: ClipOval(
                    child: NetworkImageWidget(
                        imageUrl: ApiEndPoints.imageBaseUrl + user.image),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w800),
                      ),
                      if (user.typingTo == currentUserId)
                        Text(
                          'typing....',
                          style: TextStyle(
                              color: Color(0xFF1A1819),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        )
                      else if (user.isOnline == 0)
                        Text(
                          'Last seen At ${user.formateLastSeen}',
                          style: TextStyle(
                              color: Color(0xFF1A1819),
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
                                  color: Color(0xFF1A1819),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                Image.asset(
                  'asset/images/menu1.png',
                  height: 42,
                  width: 42,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
