import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../auth_state/page_progress_model.dart';
import '../../providers/profile_steps_provider/profile_steps_provider.dart';

class OnBoardingTransiation extends ConsumerStatefulWidget {
  const OnBoardingTransiation({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnBoardingTransiationState();
}

class _OnBoardingTransiationState extends ConsumerState<OnBoardingTransiation> {
  bool _isStartAnimation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isStartAnimation ? Colors.white : Color(0xFFF4FCFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            60.verticalSpace,
            if (_isStartAnimation)
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: BackIcon())),
            Padding(
              padding: EdgeInsets.only(
                left: 41,
                right: 41,
              ),
              child: Image.asset(
                'asset/images/onnoardingcheck.png',
                height: 293.h,
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Text(
                _isStartAnimation
                    ? "Whether it's the role you're open to \noffering or the role you're hoping others \ncan fill, "
                    : "Woo-hoo! We've \nloved getting to know you - seriously, who wouldn't? You're fabulous!",
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
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Text(
                _isStartAnimation
                    ? "we're here to make it happen! Ready? "
                    : "Now it's time to think about what you want in a chosen family.",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333)),
                textAlign: TextAlign.center,
              ),
            ),
            32.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    if(_isStartAnimation){
                      final formStep = FormStepModel(
                        phase: 2,
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

                      context.navigateTo(sign_up_steps2());
                    }else{
                      setState(() {
                        _isStartAnimation = true;
                      });
                    }

                  },
                  child: _isStartAnimation
                      ? Text(
                          "Let's GO!",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )
                      : Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
