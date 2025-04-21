import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/splashscreen/splashscreen2.dart';
import 'package:relative_choice/navigationextension.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      context.navigateTo(SplashScreen2());
    });
  }

  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          44.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(44),
            child: Image(
              image: AssetImage(
                'asset/images/g10.png',
              ),
              height: 113,
              width: 111.49,
            ),
          ),
          60.verticalSpace,
          Center(
            child: Text('RelativeChoice \n welcomes you \n         home',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.10,
                  letterSpacing: -1,
                )),
          ),
          84.verticalSpace,
          Expanded(
              child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              'asset/images/path28.png',
              fit: BoxFit.cover,
            ),
          )),
        ],
      ),
    );
  }
}
