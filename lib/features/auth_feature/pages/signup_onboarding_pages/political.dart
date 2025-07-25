import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/customWidgets.dart';
import 'package:relative_choice/core/widgets/faith_options.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

class Politics extends ConsumerStatefulWidget {
  const Politics({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PoliticsState();
}

class _PoliticsState extends ConsumerState<Politics> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Politics ",
              text2:
                  "Let's talk politics—just a bit! People seek family connections in many ways, and for some, sharing similar political views helps with finding common ground. Let us know if this matters to you."),
          32.verticalSpace,
          CoustomText(
              text: "Options",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          17.verticalSpace,
          PoliticsOption(onChanged: (String value) {
            print(value);
            ref.read(authNotifierProvider.notifier).accountHolderPolitics(value);
          },),
          32.verticalSpace,
          CommonText(),
          32.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
              onClick: () {
             ref.read(authNotifierProvider.notifier).updateAccountHolderPolitics();
              },
          title: "Next",
          ),
          32.verticalSpace
        ],
      ),
    );
  }
}
