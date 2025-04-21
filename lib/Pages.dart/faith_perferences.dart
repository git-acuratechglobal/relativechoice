import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/common.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/custom_toggle.dart';

class FaithPerferences extends ConsumerStatefulWidget {
  const FaithPerferences({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FaithPerferencesState();
}

class _FaithPerferencesState extends ConsumerState<FaithPerferences> {
  List<String> optionsSelectedList = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Faith Perferences ',
              text2:
                  "Great job so far! Now, let us know about the faiths you'd feel comfortable connecting with in your chosen family. Choose the options that best reflect your preferences, or select 'Open to All."),
          24.verticalSpace,
          CustomToggle(
            toggletitle: 'Open to All',
            optiontitle: 'Faith Options',
            optionsList: Common().faithlabel,
            optionsSelectedList: optionsSelectedList,
            onChanged: (List<String> value) {}, name: 'Faith Perferences',
          ),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CustomToggle(
            optiontitle: "Devoutness Scale",
            optionsList: Common().devoutness,
            optionsSelectedList: optionsSelectedList,
            onChanged: (List<String> value) {}, name: 'Devoutness Scale',
          ),
          24.verticalSpace,
           CustomToggle2(),
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
          32.verticalSpace
        ],
      ),
    );
  }
}
