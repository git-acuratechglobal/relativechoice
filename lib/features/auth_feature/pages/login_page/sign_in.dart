import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/validator/validator.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/core/widgets/routeanimation.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../forget_password.dart/email.dart';
import '../welcome_screen.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final _fKey = GlobalKey<FormState>();
  bool _isSecurePass = true;
  @override
  Widget build(BuildContext context) {
    final validator = ref.watch(validatorsProvider);
    return Scaffold(
      backgroundColor: Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _fKey,
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
                      child: CrossIcon())
                ],
              ),
              32.verticalSpace,
              CustomText(
                  text: "Sign-In",
                  text2: "Enter your email and passcode to sign in."),
              32.verticalSpace,
              Text(
                "Email Address",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              TextFormField(
                validator: (val) => validator.validateEmail(val),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                  hintText: "Please enter your email address...",
                  fillColor: Color(0xFFFFFFFF),
                ),
                autofocus: false,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) {
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateLoginParam("email", val);
                },
                onTapOutside: (val) {
                  FocusScope.of(context).unfocus();
                },
              ),
              16.verticalSpace,
              Text(
                "Password",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              TextFormField(
                obscuringCharacter: '*',
                obscureText: _isSecurePass,
                validator: (val) => validator.validatePassword(val),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF777777)),
                    hintText: "Please enter your password...",
                    fillColor: Color(0xFFFFFFFF),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isSecurePass = !_isSecurePass;
                        });
                      },
                      child: Icon(_isSecurePass
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    )),
                autofocus: false,
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                onSaved: (val) {
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateLoginParam("password", val);
                },
                onTapOutside: (val) {
                  FocusScope.of(context).unfocus();
                },
              ),
              16.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, CreateRoute(Email()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF005FF2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
              PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                onClick: () {
                  if (_fKey.currentState!.validate()) {
                    _fKey.currentState!.save();
                    ref.read(authNotifierProvider.notifier).loginUser();
                  }
                },
                title: "Sign-In",
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
                            decoration: TextDecoration.underline))),
              ),
              31.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xFFE8E6EA), thickness: 1),
                  ),
                  15.horizontalSpace,
                  Text(
                    'Today',
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
              ),
              24.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
