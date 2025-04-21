import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/onboarding/on_boarding_2.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/relative_image.dart';


class SplashScreen3 extends ConsumerStatefulWidget {
  const SplashScreen3({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends ConsumerState<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
     context.navigateTo(SplashScreen3());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FFF4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          topImage(),
          48.verticalSpace,
          // 44.horizontalSpace,
          Text(" Where you choose \nthe family that feels \n just right.  ",
          textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat')),
       
          84.verticalSpace,
          Image.asset(
            'asset/images/heart1.png',
        
            height: 150.08,
          ),

         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 40.w),
           child: ElevatedButton(onPressed: () {
               context.navigateTo((OnBoarding2()));
            
            
           }, child: Text("Let's Go!")),
         )
        ],
      ),
    );
  }
}
