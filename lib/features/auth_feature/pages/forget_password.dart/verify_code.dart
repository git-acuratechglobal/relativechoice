import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/core/widgets/routeanimation.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/relative_image.dart';
import 'forget_password.dart';

class VerifyCode extends ConsumerStatefulWidget {
  const VerifyCode({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends ConsumerState<VerifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      icon: const BackIcon()),
                  const Center(child: topImage()),
                  50.horizontalSpace
                ],
              ),
            ),
            32.verticalSpace,
            const CustomText(
                text: "Enter Your Code!",
                text2: "Please enter the code we have sent to your email."),
            32.verticalSpace,
            const Text(
              "Enter your Code",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            TextField(
              //  controller: _editingController,
              decoration: InputDecoration(
                hintText: 'Please enter the code. ',  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF777777)),
              ),
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
                 Navigator.push(context, CreateRoute(const ForgetPassword()));
                },
                child: const Text('Submit Code')),
            16.verticalSpace,
            const Center(
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
