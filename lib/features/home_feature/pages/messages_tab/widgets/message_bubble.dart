import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ChatMessageBubble extends StatelessWidget {
  final String text;
  final bool isOwnMessage;
  final String time; // e.g., '2:55 PM'

  const ChatMessageBubble({
    super.key,
    required this.text,
    required this.isOwnMessage,
    this.time = "2:55 PM",
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isOwnMessage ? Alignment.topRight : Alignment.topLeft;
    final borderRadius = isOwnMessage
        ? const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );
    final backgroundColor = isOwnMessage ? const Color(0xFFF8F8F8) : null;
    final gradient = isOwnMessage
        ? null
        : const LinearGradient(
            colors: [
              Color(0xFFF5FAE7),
              Color(0xFFDCF1FD),
            ],
          );

    return Column(
      crossAxisAlignment:
          isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: alignment,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                gradient: gradient,
                borderRadius: borderRadius,
              ),
              child: AutoSizeText(
                text,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        4.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment:
                isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: const Color(0xFF6C727F),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (isOwnMessage) ...[
                const SizedBox(width: 4),
                Image.asset(
                  'asset/images/done-all.png',
                  height: 16,
                  width: 16,
                )
              ]
            ],
          ),
        )
      ],
    );
  }
}
