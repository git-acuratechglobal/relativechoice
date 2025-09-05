import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/role_options.dart';

class Distance extends ConsumerStatefulWidget {
  const Distance({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DistanceState();
}

class _DistanceState extends ConsumerState<Distance> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          const CustomText(
              text: 'Distance',
              text2:
                  "How far are you willing to travel to connect with your chosen family? Select a distance range that feels comfortable."),
          32.verticalSpace,
          CoustomText(
              text: "Distance Options ",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          DistanceOptions(
            onSelectionChanged: (String selectedValue) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateDistanceParam('distance', selectedValue);
            },
          ),
          24.verticalSpace,
          const Divider(
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
          TextFormField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Let us know any additional areas you're open to....",
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
                  .updateDistanceParam('additionalLocation', val);
            },
            onTapOutside: (val) {
              FocusScope.of(context).unfocus();
            },
          ),
          32.verticalSpace,
          const CommonText(),
          32.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: "Next",
              onClick: () {
                ref.read(authNotifierProvider.notifier).updateDistance();
              }),
          32.verticalSpace,
        ],
      ),
    );
  }
}
