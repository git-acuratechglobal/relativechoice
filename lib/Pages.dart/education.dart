import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Pages.dart/family_structure.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/faith_options.dart';

class Education extends ConsumerStatefulWidget {
  const Education({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EducationState();
}

class _EducationState extends ConsumerState<Education> {
  @override
  Widget build(BuildContext context) {
    final selectedFamilyType = ref.watch(userTypeProvider);

    return SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Education Level',
              text2:
                  "Education and training come in many forms. Share your education, trade experience, or current studies if you'd like, or skip if you prefer."),
          32.verticalSpace,
          CoustomText(
              text: "Primary Account Holder Education",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          8.verticalSpace,
          EducationOptions(
            
          ),
       24.verticalSpace,
          if (selectedFamilyType != 'Individual'&&  selectedFamilyType!= 'Single Parent')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                    text: "Partner's Education Level",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    )),
                8.verticalSpace,
                EducationOptions(
                  
                ),
              ],
            ),
            32.verticalSpace,
            CommonText(),
            32.verticalSpace,
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
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
          ),
          32.verticalSpace
        ],
      ),
    );
  }
}
