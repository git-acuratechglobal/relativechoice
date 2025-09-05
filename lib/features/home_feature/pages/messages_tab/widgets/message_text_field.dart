import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField(
      {super.key,
      required this.controller,
      required this.onSend,
      required this.onChanged,
      required this.onTapOutSide});
  final TextEditingController controller;
  final VoidCallback onSend;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent?) onTapOutSide;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: TextFormField(
        onTapOutside: onTapOutSide,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF777777),
          ),
          hintText: " Type your message...",
          fillColor: const Color(0xFFFFFFFF),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              width: 83,
              height: 48,
              child: ElevatedButton(
                onPressed: onSend,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
}
