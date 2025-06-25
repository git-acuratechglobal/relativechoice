import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/role_options.dart';

class RoleSought extends ConsumerStatefulWidget {
  const RoleSought({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleSoughtState();
}

class _RoleSoughtState extends ConsumerState<RoleSought> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: "Role Sought",
              text2:
                  "Select all family roles you're open to connecting with. Check all that apply!"),
          32.verticalSpace,
          CoustomText(
              text: "Options ",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          RoleOptions(onSelectedChanged: (val ) {
            ref.read(authNotifierProvider.notifier).updateRoleSoughtParam(val);
          },),
          25.verticalSpace,
          Container(
            width: 327.w,
            height: 70.h,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color(0xFFFFFFFF),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 239, 237, 237),
                    blurRadius: 14,
                    spreadRadius: 4,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                width: 247,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Please Note: ",
                            style: TextStyle(
                                color: Color(0xFF57C05C),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800)),
                        TextSpan(
                            text:
                                "Relative Choice does not offer romantic matching. ",
                            style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          32.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
            title: 'Next', onClick: () {
            ref.read(authNotifierProvider.notifier).updateRoleSought();
          },),
          32.verticalSpace
        ],
      ),
    );
  }
}
