import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/auth_feature/pages/welcome_screen.dart';
import 'package:relative_choice/core/validator/validator.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import '../../../../core/utils/appbutton.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../../providers/authprovider.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final validator = ref.watch(validatorsProvider);
    return Scaffold(
      backgroundColor: Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  40.horizontalSpace,
                  Image.asset(
                    'asset/images/relativeimage4.png',
                    width: 74.w,
                    height: 75.h,
                  ),
                  InkWell(
                    onTap: () {
                      context.navigateTo(WelcomeScreen());
                    },
                    child: CrossIcon(),
                  )
                ],
              ),
              32.verticalSpace,
              CustomText(
                text: "Sign-Up",
                text2:
                    "Please enter your email address. We'll \nemail you a code to verify your account",
              ),
              32.verticalSpace,
              Text(
                "Email Address",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              TextFormField(
                validator: validator.validateEmail,
                controller: _emailController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777),
                  ),
                  hintText: "  Please enter your email address.",
                  fillColor: Color(0xFFFFFFFF),
                ),
                autofocus: false,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) {
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateSignupParam("email", newValue);
                },
                onTapOutside: (val) {
                  FocusScope.of(context).unfocus();
                },
              ),
              24.verticalSpace,
              PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                onClick: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    ref.read(authNotifierProvider.notifier).sendOtp();
                  }
                },
                title: "Email me the code!",
              ),
              20.verticalSpace,
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Need help?',
                    style: TextStyle(
                      color: Color(0xFF005FF2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              31.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xFFE8E6EA), thickness: 1),
                  ),
                  15.horizontalSpace,
                  Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6C727F),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  15.horizontalSpace,
                  Expanded(
                    child: Divider(color: Color(0xFFE8E6EA), thickness: 1),
                  ),
                ],
              ),
              30.verticalSpace,
              CustomButton(
                title: 'Continue with Apple',
                boxcolor: Colors.black,
                textcolor: Colors.white,
                circularcontainercolor: Colors.white,
                image: Image.asset(
                  'asset/images/applelogo.png',
                ),
                onTap: () {
                  print('hiii');
                },
              ),
              16.verticalSpace,
              CustomButton(
                title: 'Continue with Google',
                boxcolor: Colors.white,
                textcolor: Colors.black,
                circularcontainercolor: Color(0xFFF1F1F1),
                image: Image.asset('asset/images/google.png'),
                onTap: () {},
              ),
              16.verticalSpace,
              CustomButton(
                title: 'Continue with Facebook',
                boxcolor: Colors.white,
                textcolor: Colors.black,
                circularcontainercolor: Color(0xFFF1F1F1),
                image: Image.asset('asset/images/facebook.png'),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
