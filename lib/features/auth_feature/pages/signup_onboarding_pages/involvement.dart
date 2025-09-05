import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/custom_toggle.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';

class InvolvementScreen extends ConsumerStatefulWidget {
  const InvolvementScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InvolvementScreenState();
}

class _InvolvementScreenState extends ConsumerState<InvolvementScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          const CustomText(
              text: 'Involvement ',
              text2:
                  "How involved do you hope to be with your chosen family? Select all that apply to let others know the type of connection you're open to."),
          16.verticalSpace,
          InvolvementToggle(
            onSelectionChanged: (String selectedValue) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateInvolvementParam("involvement", selectedValue);
            },
          ),
          24.verticalSpace,
          const Divider(
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
          TextFormField(
            decoration: const InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777)),
                fillColor: Color(0xFFFFFFFF)),
            autofocus: false,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateInvolvementParam("involvementSpecific", val);
            },
            onTapOutside: (val) {
              FocusScope.of(context).unfocus();
            },
          ),
          24.verticalSpace,
          Text(
            'Additional',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          8.verticalSpace,
          TextFormField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Any specific details you want to add...",
              hintStyle: TextStyle(
                color: const Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
            onChanged: (val) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateInvolvementParam("involvementAdditionalDetails", val);
            },
            onTapOutside: (val) {
              FocusScope.of(context).unfocus();
            },
          ),
          32.verticalSpace,
          Container(
            width: 327.w,
            height: 70.h,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xFFFFFFFF),
                shadows: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 239, 237, 237),
                    blurRadius: 14,
                    spreadRadius: 4,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SizedBox(
                width: 247,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Please Note: ",
                            style: TextStyle(
                                color: const Color(0xFF57C05C),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800)),
                        TextSpan(
                            text:
                                "The algorithm cannot match based on this, but their response will appear on their profile. ",
                            style: TextStyle(
                                color: const Color(0xFF777777),
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
          const CommonText(),
          32.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: "Next",
              onClick: () {
                ref.read(authNotifierProvider.notifier).updateInvolvement();
              }),
          32.verticalSpace
        ],
      ),
    );
  }
}
