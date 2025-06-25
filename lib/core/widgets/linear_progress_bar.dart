import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:relative_choice/features/auth_feature/pages/signup_onboarding_pages/family_structure.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';

import 'common.dart';

class progressBar extends ConsumerStatefulWidget {
  const progressBar({super.key});

  @override
  ConsumerState<progressBar> createState() => _progressBarState();
}

class _progressBarState extends ConsumerState<progressBar> {
  @override
  Widget build(BuildContext context) {
    final barValue=ref.watch(progressBarValueProvider);
    final userType = ref.watch(userTypeProvider);
    print("barValue $barValue");
    return Center(
      child: LinearProgressBar(
         maxSteps: Common.stepPageList(userType).length,
        progressType: LinearProgressBar.progressTypeLinear,
        minHeight: 6,
        progressColor: Color(0xFF57C05C),
        backgroundColor: Color.fromARGB(255, 220, 219, 219),
        borderRadius: BorderRadius.circular(10),
        currentStep: barValue,
      ),
    );
  }
}


class progressBar2 extends ConsumerStatefulWidget {
  const progressBar2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _progressBar2State();
}
class _progressBar2State extends ConsumerState<progressBar2> {
 
  @override
  Widget build(BuildContext context) {
     final barValue2=ref.watch(progressBarValueProvider2);
     print("barValue2 $barValue2");
    return Center(
      child: LinearProgressBar(
         maxSteps: Common.stepPageList2.length,
        progressType: LinearProgressBar.progressTypeLinear,
        minHeight: 6,
        progressColor: Color(0xFF57C05C),
        backgroundColor: Color.fromARGB(255, 220, 219, 219),
        borderRadius: BorderRadius.circular(10),
        currentStep: barValue2,
      ),
    );
  }
}

class progressBar3 extends ConsumerStatefulWidget {
  const progressBar3({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _progressBar3State();
}
class _progressBar3State extends ConsumerState<progressBar3> {
 
  @override
  Widget build(BuildContext context) {
     final barValue3=ref.watch(progressBarValueProvider3);
     print("barValue2 $barValue3");
    return Center(
      child: LinearProgressBar(
         maxSteps: Common.stepPageList3.length,
        progressType: LinearProgressBar.progressTypeLinear,
        minHeight: 6,
        progressColor: Color(0xFF57C05C),
        backgroundColor: Color.fromARGB(255, 220, 219, 219),
        borderRadius: BorderRadius.circular(10),
        currentStep: barValue3,
      ),
    );
  }
}

