import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class ChildrenFaith extends ConsumerStatefulWidget {
  const ChildrenFaith({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChildrenFaithState();
}

class _ChildrenFaithState extends ConsumerState<ChildrenFaith> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Children's Faith",
              text2:
                  "For families with children of various faith backgrounds, please select all that apply. You may add additional details in the text box if you wish."),
          32.verticalSpace,
          CoustomText(
              text: 'Faith Options',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          FaithOptions(onChanged: (String selectedFaiths) {  },),
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
          DevoutnessScale(onChanged: (String selected) {  },),
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
          32.verticalSpace,
        ],
      ),
    );
  }
}
