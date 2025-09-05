import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/custom_toggle.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/common.dart';
import '../../../../core/widgets/customWidgets.dart';

class PoliticalPerferences extends ConsumerStatefulWidget {
  const PoliticalPerferences({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PoliticalPerferencesState();
}

class _PoliticalPerferencesState extends ConsumerState<PoliticalPerferences>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<String> optionsSelectedList = [];
  String? selectedPoliticalPreferences;
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
              text: 'Political Preferences ',
              text2:
                  "So, we need to talk politics—just a bit! People seek family connections in many ways, and for some, sharing similar political views helps with finding common ground. Let us know if this matters to you."),
          24.verticalSpace,
          CustomToggle(
            optionsList: Common().politics,
            optionsSelectedList: optionsSelectedList,
            onChanged: (value) {
              setState(() {
                selectedPoliticalPreferences = value;
              });
              ref
                  .read(authNotifierProvider.notifier)
                  .updatePoliticalPreferenceParam('preferenceOptions', value);
            },
            name: 'Options',
          ),
          24.verticalSpace,
          const Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CustomToggle2(
            isOpen: selectedPoliticalPreferences == "Open to All" ||
                (selectedPoliticalPreferences != null &&
                    selectedPoliticalPreferences!.isEmpty),
            onChanged: (int selectedValue) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updatePoliticalPreferenceParam('dealBreaker', selectedValue);
            },
            onTextChanged: (String text) {},
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Please note this information will appear on your public profile. Content must be respectful and follow ',
                  style: TextStyle(
                    color: const Color(0xFF777777),
                    fontSize: 12.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Community Guidelines.',
                  style: TextStyle(
                    color: const Color(0xFF005FF2),
                    fontSize: 12.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: 'Next',
              onClick: () {
                ref
                    .read(authNotifierProvider.notifier)
                    .updatePoliticalPreference();
              }),
          32.verticalSpace,
        ],
      ),
    );
  }
}
