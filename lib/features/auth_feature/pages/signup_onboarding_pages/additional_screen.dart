import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';

class AdditionalScreen extends ConsumerStatefulWidget {
  const AdditionalScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdditionalScreenState();
}

class _AdditionalScreenState extends ConsumerState<AdditionalScreen>with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final parentController = TextEditingController();
  final _fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _fkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            CustomText(
                text: 'Additional Information',
                text2: 'Please add your additional information below'),
            32.verticalSpace,
            CoustomText(
              text: "Partner's Age",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
            ),
            8.verticalSpace,
            CustomTextField(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Filed is required";
                } else {
                  return null;
                }
              },
              controller: parentController,
              label: "Please enter your partner's age",
              keyboardType: TextInputType.number,
              onSaved: (val){
                ref.read(authNotifierProvider.notifier).partnerAge(int.parse(val));
              },
            ),
            8.verticalSpace,
            CoustomText(
              text:
                  'This helps with safety and security and also helps \nwith compatibility in family matching.',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF777777),
                fontStyle: FontStyle.italic,
              ),
            ),
            32.verticalSpace,
            Expanded(
              child:
                  Align(alignment: Alignment.bottomCenter, child: CommonText()),
            ),
            32.verticalSpace,
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                  onClick: () {
                    if (_fkey.currentState!.validate()) {
                      _fkey.currentState!.save();
                      ref
                          .read(authNotifierProvider.notifier)
                          .updatePartnerAge();
                    }
                  },
                  title: "Next"),
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
