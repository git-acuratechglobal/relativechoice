import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/images/Back.png',
      width: 42.w,
      height: 42.h,
    );
  }
}


class CrossIcon extends StatelessWidget {
  const CrossIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/images/cross.png',
      width: 42.w,
      height: 42.h,
    );
  }
}
