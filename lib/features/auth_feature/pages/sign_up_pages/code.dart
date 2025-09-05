import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/pinput_widget.dart';
import '../../../../core/widgets/relative_image.dart';
import '../../providers/authprovider.dart';

class Code extends ConsumerStatefulWidget {
  const Code({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CodeState();
}

class _CodeState extends ConsumerState<Code> {
  final _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4FCFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _fKey,
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
              Text(
                "Enter your Code",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              Center(
                  child: PinPutWidget(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter code";
                  }
                  return null;
                },
                onCompleted: (val) =>
                    ref.read(authNotifierProvider.notifier).updateOtp(val),
              )),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Please entre your code ',
              //     hintStyle: TextStyle(
              //         fontSize: 14.sp,
              //         fontWeight: FontWeight.w500,
              //         color: Color(0xFF777777)),
              //   ),
              //   controller: _codeEditing,
              //   autofocus: false,
              //   cursorColor: Colors.black,
              //   keyboardType: TextInputType.phone,
              //   onChanged: (value) {
              //      ref.read(authNotifierProvider.notifier).updateOtp(value);
              //   },
              //   onTapOutside: (val){
              //     FocusScope.of(context).unfocus();
              //   },
              // ),
              24.verticalSpace,
              PrimaryButton(
                  isLoading: ref.watch(authNotifierProvider).isLoading,
                  onClick: () {
                    if (_fKey.currentState!.validate()) {
                      _fKey.currentState!.save();
                      ref.read(authNotifierProvider.notifier).matchOtp();
                    }
                  },
                  title: 'Submit Code'),
              16.verticalSpace,
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
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
                            color: const Color(0xFF005FF2),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: ' for assistance.',
                        style: TextStyle(
                          color: const Color(0xFF777777),
                          fontSize: 14.sp,
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
      ),
    );
  }
}
