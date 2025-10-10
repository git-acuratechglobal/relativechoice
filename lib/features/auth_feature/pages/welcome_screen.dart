import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/features/auth_feature/pages/login_page/sign_in.dart';
import 'package:relative_choice/core/widgets/routeanimation.dart';
import 'package:relative_choice/features/auth_feature/pages/splashscreen/splashScreen.dart';
import 'package:relative_choice/features/auth_feature/pages/static_pages/privacy_policy_page.dart';
import '../../../core/widgets/relative_image.dart';
import '../auth_state/auth_state.dart';
import 'beta_code_page/beta_code_screen.dart';
import '../providers/authprovider.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(authNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData<AuthState?> data when data.value != null:
          final event = data.value?.authEvent;
          handleEvent(event!,context,data,ref);
        case AsyncError error:
          Utils.showSnackBar(context, error.error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FFF4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            60.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   child: BackIcon(),
                  //   onTap: () {
                  //     context.navigateAndReplace(Splashscreen());
                  //   },
                  // ),
                  Center(child: topImage()),
                  // 50.horizontalSpace
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
                    padding: const EdgeInsets.symmetric(horizontal: 52),
                    child: Image.asset(
                      'asset/images/path.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Positioned(
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, CreateRoute(const BetaCodeScreen()));
                  },
                  child: const Text("Sign-Up")),
            ),
            16.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                  onPressed: () {
                    context.navigateTo(const SignIn());
                  },
                  child: const Text("Sign-In")),
            ),
            20.verticalSpace,
            const Padding(
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
            const Divider(
              color: Color(0xFFDEDEDE),
            ),
            24.verticalSpace,
            Column(
              children: [
                InkWell(
                  onTap: (){
                    // context.navigateTo(const PrivacyPolicyPage());
                  },
                  child: Text('Terms of Service',
                      style: TextStyle(
                          color: const Color(0xFF005FF2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          height: 1.30.sp,
                          decoration: TextDecoration.underline)),
                ),
                10.verticalSpace,
                InkWell(
                  onTap: (){
                    context.navigateTo(const PrivacyPolicyPage());
                  },
                  child: Text('Privacy and Cookies Policy',
                      style: TextStyle(
                          color: const Color(0xFF005FF2),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          height: 1.30.sp,
                          decoration: TextDecoration.underline)),
                ),
                10.verticalSpace,
                Text('Consumer Health Data Policy',
                    style: TextStyle(
                        color: const Color(0xFF005FF2),
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
