import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/message_model.dart';

class OwnMessageBubble extends StatelessWidget {
final MessageModel message;

  const OwnMessageBubble({
    super.key,
    required this.message,

  });

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
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                message.formattedTime,
                style: TextStyle(
                  color: const Color(0xFF6C727F),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 4),
              // Image.asset(
              //   'asset/images/done-all.png',
              //   height: 16,
              //   width: 16,
              // )
              switch(message.isSeen){


                true => Icon(Icons.done_all,color: Color(0xff57C05C),size: 16.sp,),

                false => Icon(Icons.done,color: Color(0xff57C05C),size: 16.sp,),
              }

            ],
          ),
        )
      ],
    );
  }
}




