import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class RaceEthnicityPartner extends ConsumerStatefulWidget {
  const RaceEthnicityPartner({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceEthnicityPartnerState();
}

class _RaceEthnicityPartnerState extends ConsumerState<RaceEthnicityPartner> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Race and Ethnicity ",
              text2:
                  "Please select the race and ethnicity that best describes your partner."),
          32.verticalSpace,
          CoustomText(
              text: "Partner's Race and Ethnicity",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          RaceandEthnicityOptions(onChanged: (String value) {
            ref.read(authNotifierProvider.notifier).partnerRaceAndEthnicity(value);

          },),
         
          32.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
              onClick: () {
                ref.read(authNotifierProvider.notifier).updatePartnerRaceAndEthnicity();
              },
            title: "Next",
          ),
           
              32.verticalSpace
        ],
      ),
    );
  }
}
