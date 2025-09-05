import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {super.key,
      required this.message,
      required this.onPressed,
      this.height = 150,
      this.width = 280});
  final String message;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border:
          Border.all(color: Colors.black),
          borderRadius:
          BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 15),
          ),
          10.verticalSpace,

          InkWell(
            onTap: onPressed,
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF43BEE1),
                    Color(0xFFCEEB66)
                  ], // Your gradient colors
                ),
                border: Border.all(color: const Color(0xff005695)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text("Retry",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )
          // OutlinedButton(
          //     onPressed: onPressed,
          //     child: Ink(
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [Color(0xFF43BEE1), Color(0xFFCEEB66)], // Your gradient colors
          //         ),
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       child: Container(
          //         alignment: Alignment.center,
          //         child: Text(
          //           "Retry",
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ),
          // )
        ],
      ),
    );
  }
}
