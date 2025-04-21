import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/onboarding/on_boarding.dart';
import 'package:relative_choice/auth_feature/params/sign_up_params.dart';
import 'package:relative_choice/core/validator/validator.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/relative_image.dart';

class Passcode extends ConsumerStatefulWidget {
  const Passcode({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasscodeState();
}

class _PasscodeState extends ConsumerState<Passcode> {
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
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
                "Enter your Passcode",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              TextFormField(
                validator: validator.validatePassword,
                decoration: InputDecoration(
                  hintText: 'Please enter your Passcode',
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                ),
                controller: passwordController,
                autofocus: false,
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                onSaved: (newValue) {
                  ref
                      .read(signUpParamsDataProvider.notifier)
                      .update((p) => p!.copyWith(password: newValue!));
                  ;
                },
              ),
              24.verticalSpace,
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      context.navigateTo(OnBoarding1());
                  
                    }
                    // final password = passwordController.text.trim();

                    // if (password.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Please enter your passcode')),
                    //   );
                    //   return;
                    // }

                    // await ref
                    //     .read(localStorageServiceProvider)
                    //     .setPassword(password);

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Passcode saved successfully')),
                    // );
                    // print(password);
                    // context.navigateTo(OnBoarding1());
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
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
