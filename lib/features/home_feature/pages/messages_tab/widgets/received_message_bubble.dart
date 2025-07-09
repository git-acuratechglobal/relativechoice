import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/message_model.dart';

class ReceivedMessageBubble extends StatelessWidget {
  final MessageModel message;


  const ReceivedMessageBubble({
    super.key,
    required this.message,

  });

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
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF5FAE7),
                    Color(0xFFDCF1FD),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: AutoSizeText(
                message.text,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        4.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            message.formattedTime,
            style: TextStyle(
              color: const Color(0xFF6C727F),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}

