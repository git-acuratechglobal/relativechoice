import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/common.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/custom_toggle.dart';

class RaceEthnicity2 extends ConsumerStatefulWidget {
  const RaceEthnicity2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceEthnicity2State();
}

class _RaceEthnicity2State extends ConsumerState<RaceEthnicity2> {
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
              text: 'Race and Ethnicity ',
              text2:
                  "You're on a roll! Now, let's get into a bit more detail. If certain racial or ethnic backgrounds feel especially important in your search, you can let us know here. Choose 'Open to All' if you're flexible or handpick any that matter most."),
          24.verticalSpace,
              10.verticalSpace,
          CustomToggle(
            name: 'Race and Ethnicity',
            optiontitle: 'Race and Ethnicity',
            optionsList: Common().label,
            optionsSelectedList: optionsSelectedList,
            onChanged: (List<String> value) {}, 
          ),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
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
