import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/custom_toggle.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/common.dart';
import '../../../../core/widgets/customWidgets.dart';

class RaceEthnicity2 extends ConsumerStatefulWidget {
  const RaceEthnicity2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceEthnicity2State();
}

class _RaceEthnicity2State extends ConsumerState<RaceEthnicity2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<String> optionsSelectedList = [];
  String? selectedRaceAndEthnicity;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          const CustomText(
              text: 'Race and Ethnicity ',
              text2:
                  "You're on a roll! Now, let's get into a bit more detail. If certain racial or ethnic backgrounds feel especially important in your search, you can let us know here. Choose 'Open to All' if you're flexible or handpick any that matter most."),
          24.verticalSpace,
          10.verticalSpace,
          CustomToggle(
            name: 'Race and Ethnicity',
            optiontitle: 'Race and Ethnicity',
            optionsList: Common().label,
            optionsSelectedList: optionsSelectedList,
            onChanged: (value) {
              setState(() {
                selectedRaceAndEthnicity = value;
              });
              ref
                  .read(authNotifierProvider.notifier)
                  .updateRaceAndEthnicityParam('raceAndEthnicity', value);
            },
          ),
          24.verticalSpace,
          const Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          24.verticalSpace,
          CustomToggle2(
            isOpen: selectedRaceAndEthnicity == "Open to All" ||
                (selectedRaceAndEthnicity != null &&
                    selectedRaceAndEthnicity!.isEmpty),
            onChanged: (int selectedValue) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateRaceAndEthnicityParam('dealBreaker', selectedValue);
            },
            onTextChanged: (String text) {
              ref
                  .read(authNotifierProvider.notifier)
                  .updateRaceAndEthnicityParam('additionalDetails', text);
            },
          ),
          32.verticalSpace,
          PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              title: "Next",
              onClick: () {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateRoleRaceAndEthnicity();
              }),
          32.verticalSpace
        ],
      ),
    );
  }
}
