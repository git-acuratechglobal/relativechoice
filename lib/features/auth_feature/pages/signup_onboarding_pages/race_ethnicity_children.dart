import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class RaceEthnicityChildren extends ConsumerStatefulWidget {
  const RaceEthnicityChildren({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RaceEthnicityChildrenState();
}

class _RaceEthnicityChildrenState extends ConsumerState<RaceEthnicityChildren> with AutomaticKeepAliveClientMixin{
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
                  "Please select all that apply to describe your children's race and ethnicity."),
          24.verticalSpace,
          CoustomText(
              text: 'Please click as many as apply.',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black)),
          12.verticalSpace,
          CoustomText(
              text: "Children Account Holder",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          RaceandEthnicityOptions(
            onChanged: (String value) {
              ref
                  .read(authNotifierProvider.notifier)
                  .childrenRaceAndEthnicity(value);
            },
          ),
          14.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
            title: 'Next',
            onClick: () {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateChildrenRaceAndEthnicity();
            },
          ),
          32.verticalSpace
        ],
      ),
    );
  }
}
