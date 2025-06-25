import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/validator/validator.dart';
import 'package:relative_choice/features/auth_feature/pages/forget_password.dart/verify_code.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/core/widgets/routeanimation.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/relative_image.dart';

class Email extends ConsumerStatefulWidget {
  const Email({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailState();
}

class _EmailState extends ConsumerState<Email> {
  @override
  Widget build(BuildContext context) {
    final validator=ref.watch(validatorsProvider);
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
                text: "Enter Your Email!",
                text2: "Please enter the email We'll \nemail you a code to verify your account."),
            32.verticalSpace,
            Text(
              "Enter your email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            TextFormField(
              validator: (email)=>validator.validateEmail(email),
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Please enter the email.',
                hintStyle: TextStyle(color: Color(0xFF777777),)
              ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              onSaved: (val){

              },
            ),
            24.verticalSpace,
            ElevatedButton(
                onPressed: () {
                   Navigator.push(context, CreateRoute(VerifyCode()));
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


