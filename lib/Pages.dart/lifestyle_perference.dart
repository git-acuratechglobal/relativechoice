import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:relative_choice/Screens%20/onboarding/on_boarding_transaction3.dart';

import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/common.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/custom_toggle.dart';

class LifestylePerference extends ConsumerStatefulWidget {
  const LifestylePerference({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LifestylePerferenceState();
}

class _LifestylePerferenceState extends ConsumerState<LifestylePerference> {
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
              text: 'Lifestyle Preferences ',
              text2:
                  "Everyone has their lifestyle preferences. Let us know yours, so we can help match you with people who feel right at home with your habits and preferences. Scroll down to complete all sections."),
          24.verticalSpace,
          CoustomText(
              text: "🚬 Smoking Preferences",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          20.verticalSpace,
          lifestyleToggle(
              optiontitle: '',
              optionsList: Common().drinking,
              optionsSelectedList: optionsSelectedList,
              onChanged: (value) {}),
          20.verticalSpace,
          CustomToggle2(),
          20.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: "🍷 Drinking Preferences",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          lifestyleToggle(
              optiontitle: '',
              optionsList: Common().drinking,
              optionsSelectedList: optionsSelectedList,
              onChanged: (value) {}),
          20.verticalSpace,
          CustomToggle2(),
          20.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: "🐶 Pet Types ",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          CoustomText(
              text:
                  "For some, furry, feathered, or scaly family members are non-negotiable. For others, not so much. Let us know which pets are welcome and which ones might be a deal-breaker! ",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              )),
          CustomToggle(
              optionsList: Common().pets,
              optionsSelectedList: optionsSelectedList,
              onChanged: (value) {}, name: 'Options',),
          20.verticalSpace,
          CustomToggle3(),
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
              context.navigateTo(OnBoardingTransaction3());
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
