import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class PersonalLifestyle extends ConsumerStatefulWidget {
  const PersonalLifestyle({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalLifestyleState();
}

class _PersonalLifestyleState extends ConsumerState<PersonalLifestyle>with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Personal Lifestyle Choices",
              text2:
                  "Your vibe attracts your tribe! These details help us find connections that feel like home"),
          32.verticalSpace,
          CoustomText(
              text: "🚬 Smoking",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          CoustomText(
              text: "Do you use any of the following tobacco products?",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          17.verticalSpace,
          Smoking(onChanged: (val) {
            final String commaSeparated = val.entries
                .map((entry) => '${entry.key}: ${entry.value}')
                .join(', ');
            print(commaSeparated);
            ref
                .read(authNotifierProvider.notifier)
                .updatePersonalLifeStyleParam("smoking_options", commaSeparated);
          }),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CoustomText(
              text: "🍷 Drinking",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              )),
          CoustomText(
              text: "Do you drink alcohol?",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          17.verticalSpace,
          Drinking(
            onChanged: (String) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updatePersonalLifeStyleParam("drinking_options", String);
            },
          ),
          32.verticalSpace,
          CommonText(),
          32.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: "Next",
              onClick: () {
                ref
                    .read(authNotifierProvider.notifier)
                    .updatePersonalLifeStyle();
              }),
          32.verticalSpace
        ],
      ),
    );
  }
}
