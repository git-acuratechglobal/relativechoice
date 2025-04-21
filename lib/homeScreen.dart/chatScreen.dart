import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';

class Chatscreen extends ConsumerStatefulWidget {
  const Chatscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatscreenState();
}

class _ChatscreenState extends ConsumerState<Chatscreen> {
  final List<Widget> _messages = [
    ChatMessage(
        text:
            'Hi, John! I really enjoyed reading your profile. I noticed you’re looking for a sibling connection and saw that you love hiking – I’m always on the trails too! What’s one of your favorite spots? Looking forward to chatting more!'),
    ChatMessage2(
        text2:
            'Haha truly! Nice to meet you Alfredo! What about a cup of coffee today evening? ☕️ '),
    ChatMessage(text: 'Sure, let’s do it! 😊'),
    ChatMessage2(
        text2:
            "Great I will write later the exact time and place. See you soon!"),
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage2(text2: _messageController.text.trim()));
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
            ChatBar(name: 'Alfredo C.'),
            16.verticalSpace,
            _buildTodayDivider(),
            16.verticalSpace,
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: _messages.length,
                separatorBuilder: (_, __) => 10.verticalSpace,
                itemBuilder: (context, index) => _messages[index],
              ),
            ),
            _ChatTextField(_messageController, _sendMessage),
          ],
        ),
      ),
    );
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
}

Widget _ChatTextField(TextEditingController controller, VoidCallback onSend) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF777777),
        ),
        hintText: " Type your message...",
        fillColor: Color(0xFFFFFFFF),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 4),
          child: SizedBox(
            width: 83,
            height: 48,
            child: ElevatedButton(
              onPressed: onSend,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              child: Text(
                'Send',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      autofocus: false,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
    ),
  );
}

class ChatBar extends StatefulWidget {
  final String name;
  const ChatBar({super.key, required this.name});

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            child: BackIcon(),
            onTap: () {
              context.pop();
            },
          ),
          10.horizontalSpace,
          Image.asset(
            'asset/images/photo.png',
            height: 48.h,
            width: 48.w,
          ),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
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
          //   65.horizontalSpace,
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'asset/images/menu1.png',
                height: 42,
                width: 42,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatMessage extends StatefulWidget {
  final String text;
  const ChatMessage({super.key, required this.text});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 250.w,
              //   width: MediaQuery.of(context).size.width / 1.4,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFF5FAE7),
                    Color(0xFFDCF1FD),
                  ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        4.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '2:55 PM',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF6C727F),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}

class ChatMessage2 extends StatefulWidget {
  final String text2;
  const ChatMessage2({super.key, required this.text2});

  @override
  State<ChatMessage2> createState() => _ChatMessage2State();
}

class _ChatMessage2State extends State<ChatMessage2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
             // width: 230,
              width: MediaQuery.of(context).size.width / 1.4,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: AutoSizeText(
                widget.text2,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        4.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '2:55 PM',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF6C727F),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                'asset/images/done-all.png',
                height: 16,
                width: 16,
              )
            ],
          ),
        )
      ],
    );
  }
}
