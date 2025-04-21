import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/onboarding/on_boarding.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/relative_tree.dart';
import 'package:relative_choice/widgets/routeanimation.dart';

class OnBoarding2 extends ConsumerStatefulWidget {
  const OnBoarding2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends ConsumerState<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: IconButton(
                  icon: BackIcon(),
                  onPressed: () {
                    // backicon
                    context.pop();
                  },
                ),
              ),
            ),
            10.verticalSpace,
            SizedBox(height: 360.56, child: RelativeTree()),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "It’s Time to Build Your",
                style: TextStyle(
                  fontSize: 44.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Family Tree!",
              style: TextStyle(
                color: Color(0xFF005FF2),
                fontSize: 40.sp,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 64.h),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, CreateRoute(OnBoarding1()));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
            ),
            32.verticalSpace
          ],
        ),
      ),
    );
  }
}
