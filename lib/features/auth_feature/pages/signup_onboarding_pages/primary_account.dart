import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class PrimaryAccount extends ConsumerStatefulWidget {
  const PrimaryAccount({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryAccountState();
}

class _PrimaryAccountState extends ConsumerState<PrimaryAccount> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  final _fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Form(
        key: _fKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            CustomText(
                text: "Primary Account Holder's Faith",
                text2:
                    "Faith can be a significant part of life. Please select the belief system that best describes you, along with your level of connection to that faith."),
            32.verticalSpace,
            CoustomText(
                text: "Faith Options",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
            17.verticalSpace,
            FaithOptions(
              onChanged: (String selectedFaiths) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateAccountHolderFaithParam(
                        'faith_options', selectedFaiths);
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
                    .updateAccountHolderFaithParam(
                        'devoutness_scale', selected);
              },
            ),
            32.verticalSpace,
            CommonText(),
            32.verticalSpace,
            PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                title: 'Next',
                onClick: () {
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateAccountHolderFaith();
                }),
            32.verticalSpace
          ],
        ),
      ),
    );
  }
}
