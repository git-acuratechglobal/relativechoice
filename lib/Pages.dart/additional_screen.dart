import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class AdditionalScreen extends ConsumerStatefulWidget {
  const AdditionalScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdditionalScreenState();
}

class _AdditionalScreenState extends ConsumerState<AdditionalScreen> {
  final parentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Additional Information',
              text2: 'Please add your additional information below'),
          32.verticalSpace,
          CoustomText(
            text: "Partner's Age",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          8.verticalSpace,
          CustomTextField(
            controller: parentController,
            label: "Please enter your partner's age",
            keyboardType: TextInputType.number,
          ),
          8.verticalSpace,
          CoustomText(
            text:
                'This helps with safety and security and also helps \nwith compatibility in family matching.',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF777777),
              fontStyle: FontStyle.italic,
            ),
          ),
          32.verticalSpace,
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CommonText()),
          ),
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
          32.verticalSpace,
        ],
      ),
    );
  }
}
