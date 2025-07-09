import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key,required this.controller,required this.onSend,required this.onChanged});
final TextEditingController controller;
final VoidCallback onSend;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 5 ),
      child: TextFormField(
        onChanged: onChanged,
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
}

