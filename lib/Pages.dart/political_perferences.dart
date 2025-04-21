import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/common.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/custom_toggle.dart';

class PoliticalPerferences extends ConsumerStatefulWidget {
  const PoliticalPerferences({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PoliticalPerferencesState();
}

class _PoliticalPerferencesState extends ConsumerState<PoliticalPerferences> {
  List<String> optionsSelectedList = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Political Preferences ',
              text2:
                  "So, we need to talk politics—just a bit! People seek family connections in many ways, and for some, sharing similar political views helps with finding common ground. Let us know if this matters to you."),
          24.verticalSpace,
          CustomToggle(
              optionsList: Common().politics,
              optionsSelectedList: optionsSelectedList,
              onChanged: (value) {}, name: 'Options',),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CustomToggle2(),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Please note this information will appear on your public profile. Content must be respectful and follow ',
                  style: TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 12.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Community Guidelines.',
                  style: TextStyle(
                    color: Color(0xFF005FF2),
                    fontSize: 12.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          ElevatedButton(
            onPressed: () {
              ref.read(progressBarValueProvider2.notifier).state++;
              ref.read(pageControllerProvider2.notifier).state.nextPage(
                  duration: Duration(microseconds: 500),
                  curve: Curves.bounceIn);
            },
            child: Text(
              "Next",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          32.verticalSpace,
        ],
      ),
    );
  }
}
