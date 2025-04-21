import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/faith_options.dart';

class RaceEthnicityChildren extends ConsumerStatefulWidget {
  const RaceEthnicityChildren({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceEthnicityChildrenState();
}

class _RaceEthnicityChildrenState extends ConsumerState<RaceEthnicityChildren> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Race and Ethnicity ",
              text2:
                  "Please select all that apply to describe your children's race and ethnicity."),
          24.verticalSpace,
          CoustomText(
              text: 'Please click as many as apply.',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.black
              )),
          12.verticalSpace,
          CoustomText(
              text: "Children Account Holder",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          RaceandEthnicityOptions(),
          14.verticalSpace,
         
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
