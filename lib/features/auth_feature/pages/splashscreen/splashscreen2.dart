import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/features/auth_feature/pages/welcome_screen.dart';

import '../../../../core/widgets/relative_image.dart';

class SplashScreen2 extends ConsumerStatefulWidget {
  const SplashScreen2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends ConsumerState<SplashScreen2>
    with SingleTickerProviderStateMixin {
  bool _isStartAnimation = false;
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    sizeAnimation = Tween<double>(begin: 200.0, end: 80.0).animate(controller);

    Timer(Duration(seconds: 1), () {
      setState(() {
        _isStartAnimation = true;
      });
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _isStartAnimation ? Color(0xFFF4FCFF) : Color(0xFFF6FFF4),
      body: Column(
        children: [
          60.verticalSpace,
          topImage(),
          48.verticalSpace,
          Text(" Where you choose \nthe family that feels \n just right.  ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.10,
                  letterSpacing: -1,
                  fontFamily: 'Montserrat')),
          84.verticalSpace,
          _isStartAnimation
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'asset/images/g46.png',
                      width: 235.57,
                      height: 230.08,
                    ),
                    AnimatedBuilder(
                      animation: sizeAnimation,
                      builder: (context, child) {
                        return Container(
                          height: sizeAnimation.value,
                          width: sizeAnimation.value,
                          child: child,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Image.asset(
                          'asset/images/heart1.png',
                        ),
                      ),
                    )
                  ],
                )
              : Image.asset(
                  'asset/images/heart1.png',
                  height: 150.08,
                ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 50
                ),
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(localStorageServiceProvider).setOnboarding();
                      context.navigateTo((WelcomeScreen()));
                    },
                    child: Text("Let's Go!")),
              ),
            ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
