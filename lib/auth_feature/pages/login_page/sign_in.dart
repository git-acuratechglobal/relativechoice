import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/forget_password.dart/email.dart';
import 'package:relative_choice/Screens%20/welcome_screen.dart';
import 'package:relative_choice/homeScreen.dart/home.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/routeanimation.dart';


class Sign_In extends ConsumerStatefulWidget {
  const Sign_In({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Sign_InState();
}

class _Sign_InState extends ConsumerState<Sign_In> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                      context.navigateTo(Welcome_Screen());
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
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                  hintText: "Please enter your email address...",
                  fillColor: Color(0xFFFFFFFF)),
              autofocus: false,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              onTap: () {
                //on tap functionality here
              },
            ),
            16.verticalSpace,
            Text(
              "Passcode",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                  hintText: "Please enter your passcode...",
                  fillColor: Color(0xFFFFFFFF)),
              autofocus: false,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              onTap: () {
                //on tap functionality here
              },
            ),
            16.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                 Navigator.push(context, CreateRoute(Email()));
              },
                child: Text(
                  'Forgot Passcode?',
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
            ElevatedButton(onPressed: () {
              context.navigateTo(HomeScreen());
            }, child: Text("Sign-In")),
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
            ),24.verticalSpace
          ],
        ),
      ),
    );
  }
}
