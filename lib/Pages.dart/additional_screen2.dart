import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class AdditionalScreen2 extends ConsumerStatefulWidget {
  const AdditionalScreen2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdditionalScreen2State();
}

class _AdditionalScreen2State extends ConsumerState<AdditionalScreen2> {
  final childController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Additional Information',
              text2: 'Please add your additional information below'),
          CoustomText(
            text: "Number of Childerns",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          8.verticalSpace,
          CustomTextField(
            label: '0',
            keyboardType: TextInputType.number, controller: childController,
          ),
          8.verticalSpace,
          CoustomText(
            text: 'How many children are part of your family unit?',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF777777),
              fontStyle: FontStyle.italic,
            ),
          ),
          24.verticalSpace,
          CoustomText(
            text: "Age range of children",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          16.verticalSpace,
          customrange(label: 'Infant (0-2 years)'),
          customrange(label: 'Young Child (3-7 years)'),
          customrange(label: 'Older Child (8-12 years)'),
          customrange(label: 'Teen (13-17 years)'),
          customrange(label: 'Mixed Ages'),
          CoustomText(
              text: 'Select the age ranges of the children in your family.',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic)),
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
                  'Next',
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
