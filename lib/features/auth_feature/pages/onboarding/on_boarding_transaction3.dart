import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../auth_state/page_progress_model.dart';
import '../../providers/profile_steps_provider/profile_steps_provider.dart';

class OnBoardingTransaction3 extends ConsumerStatefulWidget {
  const OnBoardingTransaction3({super.key});

  @override
  ConsumerState<OnBoardingTransaction3> createState() => _OnBoardingTransaction3State();
}

class _OnBoardingTransaction3State extends ConsumerState<OnBoardingTransaction3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            40.verticalSpace,
            Row(
              children: [
                IconButton(
                  onPressed: context.pop,
                  icon: const BackIcon()),
              ],
            ),
            Image.asset(
              'asset/images/onnoardingcheck.png',
              height: 250,
            ),
            16.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Text(
                "You did it! 🎉 Now, let's move on to the fun part: putting all this together to finalize your profile!  ",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Text(
                "This is where you can share some photos and let your personality shine. Everyone's excited to see the real you!",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF333333)),
                textAlign: TextAlign.center,
              ),
            ), 
            24.verticalSpace, 
                   Align(
                    alignment: Alignment.bottomCenter,
                     child: ElevatedButton(
                                 onPressed: () {
                                   final formStep = const FormStepModel(
                                     phase: 3,
                                     subStep: 0 ,
                                     pageIndex: 0,
                                     progressValue: 0 ,
                                   );
                                   ref
                                       .read(localStorageServiceProvider)
                                       .setFormStep(formStep: formStep.stepAsString);
                                   ref
                                       .read(updateProfileStepsProvider.notifier)
                                       .updateProfileSteps(steps: formStep.stepAsString);
                                   context.navigateTo(const sign_up_steps3());
                                 },
                                 child: Text(
                                   "Let's GO",
                                   style: TextStyle(
                                       fontSize: 20.sp,
                                       fontWeight: FontWeight.w700,
                                       color: Colors.white),
                                 ),
                               ),
                   ),
          32.verticalSpace,
        ], 
           
        ),
      ),
    );
  }
}
