import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/faith_options.dart';

class PrimaryAccount extends ConsumerStatefulWidget {
  const PrimaryAccount({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryAccountState();
}

class _PrimaryAccountState extends ConsumerState<PrimaryAccount> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Primary Account Holder's Faith",
              text2:
                 "Faith can be a significant part of life. Please select the belief system that best describes you, along with your level of connection to that faith."),
          32.verticalSpace,
          CoustomText(
              text: "Faith Options",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          FaithOptions(),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: 'Devoutness Scale',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          DevoutnessScale(),
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
