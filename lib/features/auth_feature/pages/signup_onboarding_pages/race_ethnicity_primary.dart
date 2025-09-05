import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class RaceEthnicity extends ConsumerStatefulWidget {
  const RaceEthnicity({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceEthnicityState();
}

class _RaceEthnicityState extends ConsumerState<RaceEthnicity> with AutomaticKeepAliveClientMixin{
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
              text: "Race and Ethnicity ",
              text2:
                  "Everyone's story is unique. Choose the options that best reflect you."),
          24.verticalSpace,
          CoustomText(
              text: 'Please scroll down to complete all options.',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black)),
          12.verticalSpace,
          CoustomText(
              text: "Primary Account Holder",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          RaceandEthnicityOptions(
            onChanged: (String value) {
              ref
                  .read(authNotifierProvider.notifier)
                  .accountHolderRaceAndEthnicity(value);
            },
          ),
          14.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: "Next",
              onClick: () {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateAccountHolderRaceAndEthnicity();
              }),
          32.verticalSpace
        ],
      ),
    );
  }
}
