import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/features/auth_feature/pages/splashscreen/splashscreen2.dart';
import 'package:relative_choice/features/auth_feature/pages/welcome_screen.dart';
import 'package:relative_choice/features/home_feature/pages/home.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';
import '../../../../core/utils/appsnackbar.dart';
import '../../../../core/widgets/routeanimation.dart';
import '../../../profile_feature/pages/transation_prompt.dart';
import '../../auth_state/auth_state.dart';
import '../../auth_state/page_progress_model.dart';
import '../../providers/authprovider.dart';
import '../onboarding/on_boarding.dart';
import '../onboarding/on_boarding_transaction3.dart';
import '../onboarding/on_boarding_transiation.dart';
import '../sign_up_pages/code.dart';
import '../sign_up_pages/passcode.dart';
import '../sign_up_pages/sign_up_steps.dart';
import '../signup_onboarding_pages/family_structure.dart';

class Splashscreen extends ConsumerStatefulWidget {
  const Splashscreen({super.key});

  @override
  ConsumerState<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends ConsumerState<Splashscreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {});
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 3), () {
        final user = ref.watch(localStorageServiceProvider).getUserModel();
        final isOnboardingComplete =
            ref.watch(localStorageServiceProvider).getOnboarding();
        final formProgress =
            ref.watch(localStorageServiceProvider).getFormStep();
        if (!isOnboardingComplete) {
          context.navigateTo(const SplashScreen2());
          return;
        }
        if (formProgress != null) {
          ref.listenManual(authNotifierProvider, (_, next) {
            switch (next) {
              case AsyncData<AuthState?> data when data.value != null:
                final event = data.value?.authEvent;

                handleEvent(event!, context, data, ref);

              case AsyncError error:
                Utils.showSnackBar(context, error.error.toString());
            }
          });
          final step = FormStepModel.fromString(formProgress);
          final userType = ref.read(localStorageServiceProvider).getUserType();
          if (userType != null) {
            ref.read(userTypeProvider.notifier).update((_) => userType);
          }
          if (step.phase == 1) {
            context.navigateTo(SignUpSteps(
              formStep: formProgress,
            ));
            return;
          } else if (step.phase == 2) {
            context.navigateTo(sign_up_steps2(
              formStep: formProgress,
            ));
            return;
          } else if (step.phase == 3) {
            if (step.pageIndex == 3) {
              context.navigateTo(const TransationPrompt());
              return;
            }
            context.navigateTo(sign_up_steps3(
              formStep: formProgress,
            ));
            return;
          }
        }
        if (user == null) {
          context.navigateAndRemoveUntil(const WelcomeScreen());
          return;
        }
        ref.read(userProvider.notifier).update((e) => user);
        context.navigateAndRemoveUntil(const HomeScreen());
      });
    });
  }

  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          44.verticalSpace,
          const Padding(
            padding: EdgeInsets.all(44),
            child: Image(
              image: AssetImage(
                'asset/images/g10.png',
              ),
              height: 113,
              width: 111.49,
            ),
          ),
          60.verticalSpace,
          Center(
            child: Text('RelativeChoice \n welcomes you \n         home',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.10,
                  letterSpacing: -1,
                )),
          ),
          84.verticalSpace,
          Expanded(
              child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              'asset/images/path28.png',
              fit: BoxFit.cover,
            ),
          )),
        ],
      ),
    );
  }
}

void handleEvent(AuthEvent event, BuildContext context,
    AsyncData<AuthState?> data, WidgetRef ref) {
  if (event == AuthEvent.login) {
    Utils.showSnackBar(context, data.value!.response.toString());
    final formProgress = data.value?.formProgress;
    if (formProgress != null) {
      final step = FormStepModel.fromString(formProgress.toString());
      if (step.phase == 1) {
        context.navigateTo(SignUpSteps(
          formStep: formProgress.toString(),
        ));
        return;
      } else if (step.phase == 2) {
        context.navigateTo(sign_up_steps2(
          formStep: formProgress.toString(),
        ));
        return;
      } else if (step.phase == 3) {
        if (step.pageIndex == 3) {
          context.navigateTo(const TransationPrompt());
          return;
        }
        context.navigateTo(sign_up_steps3(
          formStep: formProgress.toString(),
        ));
        return;
      }
    }
    context.navigateAndRemoveUntil(const HomeScreen());
  }

  if (event == AuthEvent.otpSent) {
    context.navigateTo(const Code());
    return;
  }

  if (event == AuthEvent.otpVerified) {
    Navigator.push(context, CreateRoute(const Passcode()));
    Utils.showSnackBar(context, data.value!.response.toString());
    return;
  }

  if (event == AuthEvent.register) {
    context.navigateTo(const OnBoarding1());
    Utils.showSnackBar(context, data.value!.response.toString());
    return;
  }

  if (event == AuthEvent.personalInformation) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }

  if (event == AuthEvent.updateFamilyStructure) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.additionalInformation) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.educationLevel) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.accountHolderFaith) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.partnerFaith) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.accountHolderRaceAndEthnicity) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.partnerRaceAndEthnicity) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.accountHolderPolitics) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.partnerPolitics) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.personalLifeStyle) {
    ref.read(progressBarValueProvider.notifier).state++;
    ref.read(pageControllerProvider.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.pets) {
    context.navigateTo(const OnBoardingTransiation());
  }
  if (event == AuthEvent.roleSought) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.roleToFulfill) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.involvement) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.distance) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.faithPreferences) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.raceAndEthnicity) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.politicalPreferences) {
    ref.read(progressBarValueProvider2.notifier).state++;
    ref.read(pageControllerProvider2.notifier).state.nextPage(
        duration: const Duration(microseconds: 500), curve: Curves.bounceIn);
    return;
  }
  if (event == AuthEvent.lifeStylePreferences) {
    context.navigateTo(const OnBoardingTransaction3());
    return;
  }
}
