import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/core/widgets/network_image_widget.dart';
import 'package:relative_choice/features/home_feature/models/chat_room_model.dart';
import 'package:relative_choice/features/home_feature/models/user_data_model.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';

import '../../../../core/network/apiend_points.dart';
import '../../../profile_feature/model/user_model.dart';
import '../../providers/chat_provider/chat_provider.dart';
import '../../widgets/bottomsheet_notification.dart';
import 'chatScreen.dart';

class Messages extends ConsumerStatefulWidget {
  const Messages({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessagesState();
}

class _MessagesState extends ConsumerState<Messages> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    final currentUserId = ref.watch(userProvider)?.user?.id.toString();
    final chatRooms = ref.watch(chatRoomsProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size(1.w, 50.h),
        child: _appbar3(),
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xFFF5FAE7),
              Color(0xFFDCF1FD),
              // Color(0xFFEDFEFF),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            120.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Recent Matches',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 92.h,
                child: Row(
                  children: [
                    MatchesContainer(),
                    Expanded(
                      child: CustomScrollView(
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            sliver: SliverList.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return MatchesContainer2();
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 15.horizontalSpace;
                              },
                              itemCount: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            26.verticalSpace,
            Expanded(
              child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white),
                  child: AsyncWidget(
                      onRetry: () => ref.refresh(chatRoomsProvider),
                      value: chatRooms,
                      data: (chatRoomsData) {
                        return CustomScrollView(
                          slivers: [
                            SliverList.separated(
                              itemCount: chatRoomsData.length,
                              itemBuilder: (BuildContext context, int index) {
                                final room = chatRoomsData[index];
                                final otherUserId =
                                    room.participants.firstWhere(
                                  (id) => id != currentUserId,
                                );
                                final userAsync = ref.watch(
                                    getUserModelDataProvider(
                                        userId: otherUserId));

                                return AsyncWidget(
                                    onRetry: () => ref.refresh(
                                        getUserModelDataProvider(
                                            userId: otherUserId)),
                                    value: userAsync,
                                    data: (userData) {
                                      return MessageWidget(
                                        key: ValueKey(userData),
                                        user: userData,
                                        chatRoom: room,
                                      );
                                    });
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 1,
                                  color: Color(0xFFDEDEDE),
                                  indent: 24,
                                  endIndent: 24,
                                );
                              },
                            ),
                          ],
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}

class _appbar3 extends StatelessWidget {
  const _appbar3();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Messages',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          actions: [notification()]),
    );
  }
}

class MessageWidget extends ConsumerStatefulWidget {
  final UserDataModel user;
  final ChatRoom chatRoom;
  const MessageWidget({super.key, required this.user, required this.chatRoom});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends ConsumerState<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    final lastMessage = widget.chatRoom.lastMessage;
    final isUnread = lastMessage != null &&
        lastMessage.senderId == widget.user.id &&
        !lastMessage.isSeen;
    return ListTile(
      onTap: () {
        context.navigateTo(ChatScreen(
          userId: int.parse(widget.user.id),
          userName: widget.user.name,
          userImage: widget.user.image,
        ));
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      leading: SizedBox(
        height: 56,
        width: 56,
        child: ClipOval(
          child: NetworkImageWidget(
              imageUrl: ApiEndPoints.imageBaseUrl + widget.user.image),
        ),
      ),
      title: Text(
        widget.user.name,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        lastMessage?.text ?? "",
        style: TextStyle(
            color: Color(0xFF1A1819),
            fontSize: 12.sp,
            fontWeight: isUnread ? FontWeight.w700 : FontWeight.w400),
      ),
      trailing: Column(
        children: [
          5.verticalSpace,
          if (isUnread)
            Image.asset(
              'asset/images/red23.png',
              width: 12.w,
              height: 12.h,
            ),
          12.verticalSpace,
          Text(
            widget.chatRoom.formattedTime,
            style: TextStyle(color: Color(0xFF6C727F), fontSize: 12),
          )
        ],
      ),
    );
  }
}

class MatchesContainer extends StatefulWidget {
  const MatchesContainer({super.key});

  @override
  State<MatchesContainer> createState() => _MatchesContainerState();
}

class _MatchesContainerState extends State<MatchesContainer> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        width: 80.w,
        height: 92.h,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF43BEE1), Color(0xFFCEEB66)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Stack(children: [
            Opacity(
              opacity: 0.3,
              child: Image.asset(
                'asset/images/person.png',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/likematch.png',
                  height: 25.h,
                  width: 20.w,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '32',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class MatchesContainer2 extends StatefulWidget {
  const MatchesContainer2({super.key});

  @override
  State<MatchesContainer2> createState() => _MatchesContainer2State();
}

class _MatchesContainer2State extends State<MatchesContainer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 92.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Stack(children: [
          Image.asset(
            'asset/images/person.png',
          ),
        ]),
      ),
    );
  }
}
