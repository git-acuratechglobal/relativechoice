import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';

class OnBoardingTransaction3 extends StatefulWidget {
  const OnBoardingTransaction3({super.key});

  @override
  State<OnBoardingTransaction3> createState() => _OnBoardingTransaction3State();
}

class _OnBoardingTransaction3State extends State<OnBoardingTransaction3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            40.verticalSpace,
            Row(
              children: [
                IconButton(
                  onPressed: context.pop,
                  icon: BackIcon()),
              ],
            ),
            Image.asset(
              'asset/images/onnoardingcheck.png',
              height: 250,
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Text(
                "You did it! 🎉 Now, let's move on to the fun part: putting all this together to finalize your profile!  ",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Text(
                "This is where you can share some photos and let your personality shine. Everyone's excited to see the real you!",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333)),
                textAlign: TextAlign.center,
              ),
            ), 
            24.verticalSpace, 
                   Align(
                    alignment: Alignment.bottomCenter,
                     child: ElevatedButton(
                                 onPressed: () {
                                   context.navigateTo(sign_up_steps3());
                                 },
                                 child: Text(
                                   "Let's GO",
                                   style: TextStyle(
                                       fontSize: 20.sp,
                                       fontWeight: FontWeight.w700,
                                       color: Colors.white),
                                 ),
                               ),
                   ),
          32.verticalSpace,
        ], 
           
        ),
      ),
    );
  }
}
