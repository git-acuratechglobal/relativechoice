import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/auth_feature/auth_state/auth_state.dart';
import 'package:relative_choice/auth_feature/pages/beta_code_page/beta_code_screen.dart';
import 'package:relative_choice/auth_feature/pages/sign_up_pages/code.dart';
import 'package:relative_choice/auth_feature/pages/sign_up_pages/passcode.dart';
import 'package:relative_choice/auth_feature/providers/authprovider.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/splashscreen/splashScreen.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/relative_image.dart';
import 'package:relative_choice/widgets/routeanimation.dart';

class Welcome_Screen extends ConsumerStatefulWidget {
  const Welcome_Screen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends ConsumerState<Welcome_Screen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(authNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData<AuthState?> data when data.value != null:
          if (data.value?.authEvent == AuthEvent.sendOtp) {
            Navigator.push(context, CreateRoute(Code()));
          }

          if (data.value?.authEvent == AuthEvent.otpVerified) {
            Navigator.push(context, CreateRoute(Passcode()));
            Utils.showSnackBar(context, data.value!.response.toString());
          }
        case AsyncError error:
          Utils.showSnackBar(context, error.error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FFF4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            60.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: BackIcon(),
                    onTap: () {
                      context.navigateAndReplace(Splashscreen());
                    },
                  ),
                  Center(child: topImage()),
                  50.horizontalSpace
                ],
              ),
            ),
            20.verticalSpace,
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52),
                    child: Image.asset(
                      'asset/images/path.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Text(
                    'Welcome \nHome, Family!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      height: 1.10,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, CreateRoute(BetaCodeScreen()));
                  },
                  child: Text("Sign-Up")),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                  onPressed: () {
                    //  ref.read(authNotifierProvider);
                  },
                  child: Text("Sign-In")),
            ),
            20.verticalSpace,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text.rich(
                  TextSpan(
                    text:
                        "By creating an account or signing in, you agree to our ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777),
                    ),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF005FF2),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF005FF2),
                        ),
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF777777),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )),
            50.verticalSpace,
            Divider(
              color: Color(0xFFDEDEDE),
            ),
            24.verticalSpace,
            Column(
              children: [
                Text('Terms of Service',
                    style: TextStyle(
                        color: Color(0xFF005FF2),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        height: 1.30.sp,
                        decoration: TextDecoration.underline)),
                Text('Privacy and Cookies Policy',
                    style: TextStyle(
                        color: Color(0xFF005FF2),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        height: 1.30.sp,
                        decoration: TextDecoration.underline)),
                Text('Consumer Health Data Policy',
                    style: TextStyle(
                        color: Color(0xFF005FF2),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        height: 1.30.sp,
                        decoration: TextDecoration.underline))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
