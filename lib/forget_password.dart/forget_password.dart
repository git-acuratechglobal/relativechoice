import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/homeScreen.dart/home.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/relative_image.dart';

class ForgetPassword extends ConsumerStatefulWidget {
  const ForgetPassword({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends ConsumerState<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: BackIcon()),
                  Center(child: topImage()),
                  50.horizontalSpace
                ],
              ),
            ),
            32.verticalSpace,
            CustomText(
                text: "Enter Your Passcode!",
                text2: "Please enter the new Passcode."),
            32.verticalSpace,
            Text(
              "Enter your New Passcode",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            TextField(
              decoration: InputDecoration(
                hintText: 'Please enter the new Password.',  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
              ),
              //  controller: _editingController,
              autofocus: false,
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              onTap: () {
                //on tap functionality here
              },
            ),
            24.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  context.navigateTo(HomeScreen());
                },
                child: Text('Submit')),
            16.verticalSpace,
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Having trouble? \n',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Contact us',
                      style: TextStyle(
                          color: Color(0xFF005FF2),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: ' for assistance.',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
