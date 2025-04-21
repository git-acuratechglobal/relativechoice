import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Pages.dart/family_structure.dart';
import 'package:relative_choice/widgets/common.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class SignUpSteps extends ConsumerStatefulWidget {
  const SignUpSteps({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpStepsState();
}

class _SignUpStepsState extends ConsumerState<SignUpSteps> {
  final PageController pageController = PageController();

  int currentStep = 0;
  
  @override
  Widget build(BuildContext context) {
  //  print(currentStep);
    final pageController = ref.watch(pageControllerProvider);
      final userType = ref.watch(userTypeProvider);
    return Scaffold(
      backgroundColor: Common.stepPageList(userType)[currentStep].$2,
      body: Column(
        children: [
          60.verticalSpace,
          TopBar(),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Common.stepPageList(userType)[index].$1;
              },
              controller: pageController,
              itemCount: Common.stepPageList(userType).length,
              onPageChanged: (index) {
                ;
                print('currentPageIndex $index');
                setState(() {
                  currentStep = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

final progressBarValueProvider = StateProvider<int>((ref) => 0);
final pageControllerProvider =
    StateProvider<PageController>((ref) => PageController());






class sign_up_steps2 extends ConsumerStatefulWidget {
  const sign_up_steps2({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _sign_up_steps2State();
}
class _sign_up_steps2State extends ConsumerState<sign_up_steps2> {
   final PageController pageController2 = PageController();

  int currentStep2 = 0;

  @override
  Widget build(BuildContext context) {
     final pageController2 = ref.watch(pageControllerProvider2);
     print("$currentStep2 bar");
    return Scaffold(
      backgroundColor: Common.stepPageList2[currentStep2].$2,
      body: Column(
        children: [
          60.verticalSpace,
          TopBar2(),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Common.stepPageList2[index].$1;
              },
              controller: pageController2,
              itemCount: Common.stepPageList2.length,
              onPageChanged: (index) {
                ;
                print('currentPageIndex $index');
                setState(() {
                  currentStep2 = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}


final progressBarValueProvider2 = StateProvider<int>((ref) => 0);
final pageControllerProvider2 =
    StateProvider<PageController>((ref) => PageController());






class sign_up_steps3 extends ConsumerStatefulWidget {
  const sign_up_steps3({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _sign_up_steps3State();
}
class _sign_up_steps3State extends ConsumerState<sign_up_steps3> {
   final PageController pageController3 = PageController();

  int currentStep3 = 0;

  @override
  Widget build(BuildContext context) {
     final pageController3 = ref.watch(pageControllerProvider3);
     print("$currentStep3 bar");
    return Scaffold(
      backgroundColor: Common.stepPageList3[currentStep3].$2,
      body: Column(
        children: [
          60.verticalSpace,
          TopBar3(),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Common.stepPageList3[index].$1;
              },
              controller: pageController3,
              itemCount: Common.stepPageList3.length,
              onPageChanged: (index) {
                print('currentPageIndex $index');
                setState(() {
                  currentStep3 = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}


final progressBarValueProvider3= StateProvider<int>((ref) => 0);
final pageControllerProvider3  =
    StateProvider<PageController>((ref) => PageController());

