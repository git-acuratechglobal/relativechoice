import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class PartnerFaith extends ConsumerStatefulWidget {
  const PartnerFaith({super.key});

  @override
  ConsumerState<PartnerFaith> createState() => _PartnerFaithState();
}

class _PartnerFaithState extends ConsumerState<PartnerFaith> with AutomaticKeepAliveClientMixin{
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
              text: "Partner's Faith",
              text2:
                  "Please select the belief system that best describes your partner, along with their level of connection to that faith."),
          32.verticalSpace,
          CoustomText(
              text: 'Faith Options',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          FaithOptions(
            onChanged: (String selectedFaiths) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updatePartnerFaithParam("faith_options", selectedFaiths);
            },
          ),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: 'Devoutness Scale',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          DevoutnessScale(
            onChanged: (String selected) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updatePartnerFaithParam("devoutness_scale", selected);
            },
          ),
          32.verticalSpace,
          CommonText(),
          32.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
            onClick: () {
              ref.read(authNotifierProvider.notifier).updatePartnerFaith();
            },
            title: "Next",
          ),
          32.verticalSpace
        ],
      ),
    );
  }
}
