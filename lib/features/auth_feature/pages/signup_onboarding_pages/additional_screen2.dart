import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/children_rage_widget.dart';
import '../../../../core/widgets/customWidgets.dart';

class AdditionalScreen2 extends ConsumerStatefulWidget {
  const AdditionalScreen2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdditionalScreen2State();
}

class _AdditionalScreen2State extends ConsumerState<AdditionalScreen2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final childController = TextEditingController();
  final _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _fKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            CustomText(
                text: 'Additional Information',
                text2: 'Please add your additional information below'),
            CoustomText(
              text: "Number of Childerns",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
            ),
            8.verticalSpace,
            CustomTextField(
              label: '0',
              keyboardType: TextInputType.number,
              controller: childController,
              onSaved: (val) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateChildrenParam("children", int.parse(val));
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field required ";
                }
                return null;
              },

            ),
            8.verticalSpace,
            CoustomText(
              text: 'How many children are part of your family unit?',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF777777),
                fontStyle: FontStyle.italic,
              ),
            ),
            24.verticalSpace,
            CoustomText(
              text: "Age range of children",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
            ),
            16.verticalSpace,
            AgeRangeOptions(
              onChanged: (String selectedRanges) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updateChildrenParam("range", selectedRanges);
              },
            ),
            CoustomText(
                text: 'Select the age ranges of the children in your family.',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777),
                    fontStyle: FontStyle.italic)),
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
                    ref.read(authNotifierProvider.notifier).updateChildrenAge();
                  }
                },
                title: 'Next',
              ),
            ),
            32.verticalSpace
          ],
        ),
      ),
    );
  }
}
