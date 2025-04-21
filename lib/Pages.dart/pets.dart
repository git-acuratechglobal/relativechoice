import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/onboarding/on_boarding_transiation.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/faith_options.dart';

class Pets extends ConsumerStatefulWidget {
  const Pets({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetsState();
}

class _PetsState extends ConsumerState<Pets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Pets",
              text2: "Does Your Family Include Paws, Fins, or Feathers?"),
          32.verticalSpace,
          CoustomText(
              text: "🐶 Pet Types ",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          CoustomText(
              text: "Select all that apply! ",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          PetsOption(),
          25.verticalSpace,
          CoustomText(
              text: 'Additional Details',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          TextField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
                  "Feel free to tell us how many and what kind of pets you have!",
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
                context.navigateTo(OnBoardingTransiation());
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
