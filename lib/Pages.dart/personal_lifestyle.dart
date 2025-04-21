import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/faith_options.dart';

class PersonalLifestyle extends ConsumerStatefulWidget {
  const PersonalLifestyle({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalLifestyleState();
}

class _PersonalLifestyleState extends ConsumerState<PersonalLifestyle> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Personal Lifestyle Choices",
              text2:
                  "Your vibe attracts your tribe! These details help us find connections that feel like home"),
          32.verticalSpace,
          CoustomText(
              text: "🚬 Smoking",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          CoustomText(
              text: "Do you use any of the following tobacco products?",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          17.verticalSpace,
          smoking(),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: "🍷 Drinking",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          CoustomText(
              text: "Do you drink alcohol?",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          17.verticalSpace,
          Drinking(),
          32.verticalSpace,
             CommonText(),
          32.verticalSpace,
          ElevatedButton(
              onPressed: () {
                ref.read(progressBarValueProvider.notifier).state++;
                ref.read(pageControllerProvider.notifier).state.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.bounceIn);
              },
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          32.verticalSpace
        ],
      ),
    );
  }
}
