import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/custom_toggle.dart';

class InvolvementScreen extends ConsumerStatefulWidget {
  const InvolvementScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InvolvementScreenState();
}

class _InvolvementScreenState extends ConsumerState<InvolvementScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Involvement ',
              text2:
                  "How involved do you hope to be with your chosen family? Select all that apply to let others know the type of connection you're open to."),
          16.verticalSpace,
          InvolvementToggle(),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          Text(
            "Other",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
          ),
          16.verticalSpace,
          Text('Looking for something specific? Let us know!',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
         TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777)),
                  fillColor: Color(0xFFFFFFFF)),
              autofocus: false,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              onTap: () {
                //on tap functionality here
               
              },
            ),
          24.verticalSpace,
          Text(
            'Additional',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          8.verticalSpace,
          TextField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Any specific details you want to add...",
              hintStyle: TextStyle(
                color: Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
          ),
          32.verticalSpace,
           Container(
            width: 327.w,
            height: 70.h,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color(0xFFFFFFFF),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 239, 237, 237),
                    blurRadius: 14,
                    spreadRadius: 4,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 24 ,right: 24),
              child: SizedBox(
                width: 247,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Please Note: ",
                            style: TextStyle(
                                color: Color(0xFF57C05C),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800)),
                        TextSpan(
                            text:
                                "The algorithm cannot match based on this, but their response will appear on their profile. ",
                            style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
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
              )),
          32.verticalSpace
        ],
      ),
    );
  }
}
