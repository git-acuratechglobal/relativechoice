import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/features/auth_feature/pages/signup_onboarding_pages/family_structure.dart';
import 'package:relative_choice/core/widgets/customWidgets.dart';
import 'package:relative_choice/features/auth_feature/providers/profile_steps_provider/profile_steps_provider.dart';
import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../core/widgets/common.dart';
import '../../auth_state/page_progress_model.dart';

class SignUpSteps extends ConsumerStatefulWidget {
  const SignUpSteps({super.key, this.formStep});
  final String? formStep;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpStepsState();
}

class _SignUpStepsState extends ConsumerState<SignUpSteps> {
  final PageController pageController = PageController();

  int currentStep = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.formStep != null) {
        final step = FormStepModel.fromString(widget.formStep!);

        if (step.phase == 1) {
          ref
              .read(pageControllerProvider.notifier)
              .state
              .jumpToPage(step.pageIndex);
          ref.read(progressBarValueProvider.notifier).state =
              step.progressValue;


        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  print(currentStep);
    final pageController = ref.watch(pageControllerProvider);
    final userType = ref.watch(userTypeProvider);
    final localService = ref.read(localStorageServiceProvider);
    return Scaffold(
      backgroundColor: Common.stepPageList(userType)[currentStep].$2,
      body: Column(
        children: [
          60.verticalSpace,
          const TopBar(),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Common.stepPageList(userType)[index].$1;
              },
              controller: pageController,
              itemCount: Common.stepPageList(userType).length,
              onPageChanged: (index) {
                print('currentPageIndex $index');
                setState(() {
                  currentStep = index;
                });
                final formStep = FormStepModel(
                  phase: 1,
                  subStep: index,
                  pageIndex: index,
                  progressValue: index,
                );
                ref
                    .read(updateProfileStepsProvider.notifier)
                    .updateProfileSteps(steps: formStep.stepAsString);
                 localService.setFormStep(formStep: formStep.stepAsString);
              },
            ),
          )
        ],
      ),
    );
  }
}

final progressBarValueProvider = StateProvider.autoDispose<int>((ref) => 0);
final pageControllerProvider =
    StateProvider.autoDispose<PageController>((ref) => PageController());

class sign_up_steps2 extends ConsumerStatefulWidget {
  const sign_up_steps2({super.key, this.formStep});
  final String? formStep;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _sign_up_steps2State();
}

class _sign_up_steps2State extends ConsumerState<sign_up_steps2> {
  final PageController pageController2 = PageController();

  int currentStep2 = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.formStep != null) {
        final step = FormStepModel.fromString(widget.formStep!);

        if (step.phase == 2) {
          ref.read(progressBarValueProvider2.notifier).state =
              step.progressValue;
          ref
              .read(pageControllerProvider2.notifier)
              .state
              .jumpToPage(step.pageIndex);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageController2 = ref.watch(pageControllerProvider2);
    print("$currentStep2 bar");
    return Scaffold(
      backgroundColor: Common.stepPageList2[currentStep2].$2,
      body: Column(
        children: [
          60.verticalSpace,
          const TopBar2(),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                final formStep = FormStepModel(
                  phase: 2,
                  subStep: index,
                  pageIndex: index,
                  progressValue: index,
                );
                ref
                    .read(localStorageServiceProvider)
                    .setFormStep(formStep: formStep.stepAsString);
                ref
                    .read(updateProfileStepsProvider.notifier)
                    .updateProfileSteps(steps: formStep.stepAsString);

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
  const sign_up_steps3({super.key, this.formStep});
  final String? formStep;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _sign_up_steps3State();
}

class _sign_up_steps3State extends ConsumerState<sign_up_steps3> {
  final PageController pageController3 = PageController();

  int currentStep3 = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.formStep != null) {
        final step = FormStepModel.fromString(widget.formStep!);

        if (step.phase == 3) {
          ref.read(progressBarValueProvider3.notifier).state =
              step.progressValue;
          ref
              .read(pageControllerProvider3.notifier)
              .state
              .jumpToPage(step.pageIndex);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageController3 = ref.watch(pageControllerProvider3);
    print("$currentStep3 bar");
    return Scaffold(
      backgroundColor: Common.stepPageList3[currentStep3].$2,
      body: Column(
        children: [
          60.verticalSpace,
          const TopBar3(),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                final formStep = FormStepModel(
                  phase: 3,
                  subStep: index,
                  pageIndex: index,
                  progressValue: index,
                );
                ref
                    .read(localStorageServiceProvider)
                    .setFormStep(formStep: formStep.stepAsString);
                ref
                    .read(updateProfileStepsProvider.notifier)
                    .updateProfileSteps(steps: formStep.stepAsString);
              },
            ),
          )
        ],
      ),
    );
  }
}

final progressBarValueProvider3 = StateProvider<int>((ref) => 0);
final pageControllerProvider3 =
    StateProvider<PageController>((ref) => PageController());
