import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';


class Explorepopup extends StatefulWidget {
  const Explorepopup({super.key});

  @override
  State<Explorepopup> createState() => _ExplorepopupState();
}

class _ExplorepopupState extends State<Explorepopup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: 164,
          width: 1.sw,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFDCF1FD),
                    Color(0xFFEDFEFE),
                    Color(0xFFF5FAE7)
                  ])),
          child: Image.asset(
            'asset/images/popscreen.png',
          ),
        ),
        32.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Take the ',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: 'lead',
                  style: TextStyle(
                    color: const Color(0xFF005FF2),
                    fontSize: 28.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    height: 1.10,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        12.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text(
            'Search beyond your matches to find family members with specific interests, locations, or roles.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        32.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: ElevatedButton(
              onPressed: () {
                context.pop();
                // context.navigateTo(Explore());
              },
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              )),
        ),
        24.verticalSpace
      ],
    );
  }
}
