import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/role_options.dart';

class Distance extends ConsumerStatefulWidget {
  const Distance({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DistanceState();
}

class _DistanceState extends ConsumerState<Distance> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Distance',
              text2:
                  "How far are you willing to travel to connect with your chosen family? Select a distance range that feels comfortable."),
          32.verticalSpace,
          CoustomText(
              text: "Distance Options ",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          DistanceOptions(),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: "Additional Location",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
          16.verticalSpace,
          CoustomText(
              text: "Do you frequently visit other locations? ",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          TextField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Let us know any additional areas you're open to....",
              hintStyle: TextStyle(
                color: Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
          ),
          32.verticalSpace,
          CommonText(),
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
