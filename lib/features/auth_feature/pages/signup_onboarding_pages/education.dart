import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/pages/signup_onboarding_pages/family_structure.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';
import '../sign_up_pages/sign_up_steps.dart';

class Education extends ConsumerStatefulWidget {
  const Education({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EducationState();
}

class _EducationState extends ConsumerState<Education>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final _fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final selectedFamilyType = ref.watch(userTypeProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _fKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            CustomText(
                text: 'Education Level',
                text2:
                    "Education and training come in many forms. Share your education, trade experience, or current studies if you'd like, or skip if you prefer."),
            32.verticalSpace,
            CoustomText(
                text: "Primary Account Holder Education",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                )),
            8.verticalSpace,
            EducationOptions(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Filed is required";
                } else {
                  return null;
                }
              },
              value: "Primary Account Holder Education",
              onChanged: (String? value) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateEducationLevelParam(
                        'account_holder_eduction', value);
              },
            ),
            24.verticalSpace,
            if (selectedFamilyType != 'Individual' &&
                selectedFamilyType != 'Single Parent')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoustomText(
                      text: "Partner's Education Level",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                      )),
                  8.verticalSpace,
                  EducationOptions(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Filed is required";
                      } else {
                        return null;
                      }
                    },
                    value: "Partner's Education Level",
                    onChanged: (String? value) {
                      ref
                          .read(authNotifierProvider.notifier)
                          .updateEducationLevelParam('partner_eduction', value);
                    },
                  ),
                ],
              ),
            32.verticalSpace,
            CommonText(),
            32.verticalSpace,
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                onClick: () {
                  if (_fKey.currentState!.validate()) {
                    _fKey.currentState!.save();
                    ref
                        .read(authNotifierProvider.notifier)
                        .updateEducationLevel();
                  }
                },
                title: "Next",
              ),
            ),
            20.verticalSpace,
            Center(
                child: TextButton(
              child: Text("Skip"),
              onPressed: () {
                ref.read(progressBarValueProvider.notifier).state++;
                ref.read(pageControllerProvider.notifier).state.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.bounceIn);
              },
            )),
            32.verticalSpace
          ],
        ),
      ),
    );
  }
}
