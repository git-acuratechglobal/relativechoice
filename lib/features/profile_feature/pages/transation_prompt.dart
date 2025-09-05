import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/features/profile_feature/pages/prompts.dart';

import '../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../core/utils/appsnackbar.dart';
import '../../home_feature/pages/home.dart';
import '../profile_state/profile_state.dart';
import '../providers/profile_onboarding_provider.dart';
import '../providers/user_provider.dart';
import 'ready_upload.dart';

class TransationPrompt extends ConsumerStatefulWidget {
  const TransationPrompt({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransationPromptState();
}

class _TransationPromptState extends ConsumerState<TransationPrompt> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(profileOnBoardingProvider, (_, next) {
      switch (next) {
        case AsyncData<ProfileState?> data when data.value != null:
          final event = data.value?.profileEvent;
          if(event==ProfileEvent.addPrompt){
            final user = data.value?.userModel;

            ref.read(userProvider.notifier).update((e) => user);
            Utils.showSnackBar(context, data.value!.response.toString());
            ref.read(localStorageServiceProvider).clearFormSession();
            context.navigateTo(const HomeScreen());
          }

        case AsyncError error:
          Utils.showSnackBar(context, error.error.toString());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FCFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const BackIcon(),
              ),
              Center(
                child: Text(
                  "  Now it’s Your\nTurn to Speak! 📣",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              32.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 31, vertical: 24),
                width: 327.w,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                        width: 1, color: Color(0xFFDFDFDF)),
                  ),
                  color: const Color(0xFFFFFFFF),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xFFDFDFDF),
                      blurRadius: 14,
                      offset: Offset(0, 8),
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '📝',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const UploadContainer(
                        text1: 'Share your story through  ',
                        text2: 'writing prompts. ',
                        text3: ''),
                    24.verticalSpace,
                    const Text(
                      '💬 ',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const UploadContainer(
                        text1: 'Choose up to ',
                        text2: '5 prompts ',
                        text3: ' to showcase who you are.'),
                    24.verticalSpace,
                    const Text(
                      '🔁  ',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const UploadContainer(
                        text1: 'You can  ',
                        text2: 'edit or swap',
                        text3: ' them anytime!')
                  ],
                ),
              ),
              32.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  context.navigateTo(const Prompts());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56.h),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
