import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagMessagePopup extends StatelessWidget {
  final Offset position;
  final VoidCallback onFlag;
  final VoidCallback onDismiss;
  const FlagMessagePopup({
    super.key,
    required this.position,
    required this.onFlag,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            child: Container(color: Colors.transparent),
          ),
        ),
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: onFlag,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, -4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]),
                child: Row(
                  children: [
                    const Icon(Icons.flag_rounded),
                    05.horizontalSpace,
                    const Text(
                      'Flag this message',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
