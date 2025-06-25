import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/custom_toggle.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/common.dart';
import '../../../../core/widgets/customWidgets.dart';

class FaithPerferences extends ConsumerStatefulWidget {
  const FaithPerferences({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FaithPerferencesState();
}

class _FaithPerferencesState extends ConsumerState<FaithPerferences>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<String> optionsSelectedList = [];
  String? selectedDevoutnessScale;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Faith Perferences ',
              text2:
                  "Great job so far! Now, let us know about the faiths you'd feel comfortable connecting with in your chosen family. Choose the options that best reflect your preferences, or select 'Open to All."),
          24.verticalSpace,
          CustomToggle(
            toggletitle: 'Open to All',
            optiontitle: 'Faith Options',
            optionsList: Common().faithlabel,
            optionsSelectedList: optionsSelectedList,
            onChanged: (value) {
              print(value);
              ref
                  .read(authNotifierProvider.notifier)
                  .updateFaithPreferenceParam('faithPerference', value);
            },
            name: 'Faith Perferences',
          ),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CustomToggle(
            optiontitle: "Devoutness Scale",
            optionsList: Common().devoutness,
            optionsSelectedList: optionsSelectedList,
            onChanged: (val) {
              setState(() {
                selectedDevoutnessScale = val;
              });
              ref
                  .read(authNotifierProvider.notifier)
                  .updateFaithPreferenceParam('devoutnessScale', val);
            },
            name: 'Devoutness Scale',
          ),
          24.verticalSpace,
          CustomToggle2(
            isOpen: selectedDevoutnessScale == "Open to All" ||
                (selectedDevoutnessScale != null &&
                    selectedDevoutnessScale!.isEmpty),
            onChanged: (int selectedValue) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateFaithPreferenceParam('dealBreaker', selectedValue);
            },
            onTextChanged: (String text) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateFaithPreferenceParam('additionalDetails', text);
            },
          ),
          32.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: "Next",
              onClick: () {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateFaithPreferences();
              }),
          32.verticalSpace
        ],
      ),
    );
  }
}
