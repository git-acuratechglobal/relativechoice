import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/custom_toggle.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';
import '../../../../core/widgets/common.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class LifestylePerference extends ConsumerStatefulWidget {
  const LifestylePerference({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LifestylePerferenceState();
}

class _LifestylePerferenceState extends ConsumerState<LifestylePerference>
    with AutomaticKeepAliveClientMixin {
  List<String> optionsSelectedList = [];
  String? selectedSmokingOptions;
  String? selectedDrinkingOptions;
  String? selectedPetTypeOptions;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            const CustomText(
                text: 'Lifestyle Preferences ',
                text2:
                    "Everyone has their lifestyle preferences. Let us know yours, so we can help match you with people who feel right at home with your habits and preferences. Scroll down to complete all sections."),
            24.verticalSpace,
            CoustomText(
                text: "🚬 Smoking Preferences",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                )),
            20.verticalSpace,
            Smoking2(
                isLifeStylePage: true,
                onChanged: (val) {

                  String ?commaSeparated;
                  if(val is Map){
                    commaSeparated = val.entries
                        .map((entry) => '${entry.key}: ${entry.value}')
                        .join(', ');
                    setState(() {
                      selectedSmokingOptions=commaSeparated;
                    });
                  }else{
                    commaSeparated=val;
                  setState(() {
                    selectedSmokingOptions=val;
                  });
                  }
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateLifeStylePreferenceParam(
                          'preferenceOptions', commaSeparated);
                }),
            // LifestyleToggle(
            //     optiontitle: '',
            //     optionsList: Common().lifeStylePreferencesOptionsList,
            //     onChanged: (value) {
            //       setState(() {
            //         selectedSmokingOptions = value;
            //       });
            //       ref
            //           .read(authNotifierProvider.notifier)
            //           .updateLifeStylePreferenceParam('preferenceOptions', value);
            //     }),
            20.verticalSpace,
            CustomToggle2(
              isOpen: selectedSmokingOptions == "Open to All" ||
                  (selectedSmokingOptions != null &&
                      selectedSmokingOptions!.isEmpty),
              key: UniqueKey(),
              onChanged: (int selectedValue) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'dealBreakerForSmoking', selectedValue);
              },
              onTextChanged: (String text) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'smokingAdditionalDetails', text);
              },
            ),
            20.verticalSpace,
            const Divider(
              color: Color(0xFFF7F7F7),
              thickness: 8,
            ),
            24.verticalSpace,
            CoustomText(
                text: "🍷 Drinking Preferences",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                )),
            15.verticalSpace,
            LifestyleToggle(
                optiontitle: '',
                optionsList: Common().lifeStylePreferencesOptionsList,
                onChanged: (value) {
                  setState(() {
                    selectedDrinkingOptions = value;
                  });
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateLifeStylePreferenceParam(
                          'drinkingPreferences', value);
                }),
            20.verticalSpace,
            CustomToggle2(
              isOpen: selectedDrinkingOptions == "Open to All" ||
                  (selectedDrinkingOptions != null &&
                      selectedDrinkingOptions!.isEmpty),
              onChanged: (int selectedValue) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'dealBreakerForDrinking', selectedValue);
              },
              onTextChanged: (String text) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'drinkingAdditionalDetails', text);
              },
            ),
            20.verticalSpace,
            const Divider(
              color: Color(0xFFF7F7F7),
              thickness: 8,
            ),
            24.verticalSpace,
            CoustomText(
                text: "🐶 Pet Types ",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                )),
            10.verticalSpace,
            CoustomText(
                text:
                    "For some, furry, feathered, or scaly family members are non-negotiable. For others, not so much. Let us know which pets are welcome and which ones might be a deal-breaker! ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
            20.verticalSpace,
            CustomToggle(
              optionsList: Common().pets,
              optionsSelectedList: optionsSelectedList,
              onChanged: (value) {
                setState(() {
                  selectedPetTypeOptions = value;
                });
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'petTypePreferences', value);
              },
              name: 'Options',
            ),
            20.verticalSpace,
            CustomToggle3(
              isOpen: selectedPetTypeOptions == "Open to All" ||
                  (selectedPetTypeOptions != null &&
                      selectedPetTypeOptions!.isEmpty),
              onToggleChanged: (int selectedValue) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'dealBreakerForPetType', selectedValue);
              },
              onNoteChanged: (String changedValue) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateLifeStylePreferenceParam(
                        'petAdditionalDetails', changedValue);
              },
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
                title: "Next",
                onClick: () {
                  ref
                      .read(authNotifierProvider.notifier)
                      .updateLifeStylePreference();
                }),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
