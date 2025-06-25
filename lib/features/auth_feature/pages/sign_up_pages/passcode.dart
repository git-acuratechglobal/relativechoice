import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/validator/validator.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/relative_image.dart';

class Passcode extends ConsumerStatefulWidget {
  const Passcode({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasscodeState();
}

class _PasscodeState extends ConsumerState<Passcode> {
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool _isSecurePass1=true;
  bool _isSecurePass2=true;
  @override
  Widget build(BuildContext context) {
    final validator = ref.watch(validatorsProvider);
    return Scaffold(
      backgroundColor: Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _key,
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
                  text: "Create Your Passcode!",
                  text2: "Please Create a Passcode."),
              32.verticalSpace,
              Text(
                "Enter your Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              TextFormField(
                obscuringCharacter: '*',
                obscureText: _isSecurePass1,
                validator: validator.validatePassword,
                decoration: InputDecoration(
                  hintText: 'Please enter your password',
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          _isSecurePass1=!_isSecurePass1;
                        });
                      },
                      child: Icon(_isSecurePass1
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    )
                ),
                controller: passwordController,
                autofocus: false,
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                onSaved: (newValue) {
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateSignupParam("password", newValue);
                  ;
                },
                onTapOutside: (val) {
                  FocusScope.of(context).unfocus();
                },
              ),
              32.verticalSpace,
              Text(
                "Confirm your Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              TextFormField(
                obscureText: _isSecurePass2,
                obscuringCharacter: '*',
                validator: (val)=>validator.confirmPassword(passwordController.text, val),
                decoration: InputDecoration(
                  hintText: 'Please confirm your password',
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          _isSecurePass2=!_isSecurePass2;
                        });
                      },
                      child: Icon(_isSecurePass2
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    )
                ),
                autofocus: false,
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                onTapOutside: (val) {
                  FocusScope.of(context).unfocus();
                },

              ),
              24.verticalSpace,
              PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                  onClick: () async {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      ref
                          .read(authNotifierProvider.notifier).register();
                    }

                  },
                title: "Submit",
              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
