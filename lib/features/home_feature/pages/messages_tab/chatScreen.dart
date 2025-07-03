import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/message_bubble.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/message_text_field.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ScrollController _chatScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _chatScrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 3.sp,
        ),
        child: CustomScrollView(
          controller: _chatScrollController,
          slivers: [
            _ChatAppBar(userName: 'Alfredo C.'),
            SliverList.separated(
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return 10.verticalSpace;
              },
              itemCount: _messages.length,
            ),
          ],
        ),
      ),
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
              controller: _messageController, onSend: _sendMessage),
        ),
      ),
    );
  }

  final List<Widget> _messages = [
    _buildTodayDivider(),
    ChatMessageBubble(
      text:
          'Hi, John! I really enjoyed reading your profile. I noticed you’re looking for a sibling connection and saw that you love hiking – I’m always on the trails too! What’s one of your favorite spots? Looking forward to chatting more!',
      isOwnMessage: false,
    ),
    ChatMessageBubble(
      text:
          'Haha truly! Nice to meet you Alfredo! What about a cup of coffee today evening? ☕️ ',
      isOwnMessage: true,
    ),
    ChatMessageBubble(
      text: 'Sure, let’s do it! 😊',
      isOwnMessage: false,
    ),
    ChatMessageBubble(
      text: "Great I will write later the exact time and place. See you soon!",
      isOwnMessage: true,
    ),
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(ChatMessageBubble(
          text: _messageController.text.trim(),
          isOwnMessage: true,
        ));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _chatScrollController.animateTo(
            _chatScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      });
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
  const _ChatAppBar({required this.userName});
  final String userName;
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
                Image.asset(
                  'asset/images/photo.png',
                  height: 48.h,
                  width: 48.w,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w800),
                      ),
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
