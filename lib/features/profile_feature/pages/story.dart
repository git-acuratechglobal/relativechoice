import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/features/home_feature/pages/profile_tab/profile_screen.dart';
import 'package:relative_choice/core/widgets/profile_card.dart';
import 'package:relative_choice/features/profile_feature/pages/profile_picture.dart';

import '../../../core/widgets/customWidgets.dart';

class Story extends ConsumerStatefulWidget {
  const Story({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryState();
}

class _StoryState extends ConsumerState<Story> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final imageList=ref.watch(imageListProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          const CustomText(
              text: 'Showcase Your Story',
              text2: 'Add up to six photos to share your story.'),
          24.verticalSpace,
          Text(
            'Example',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: const Color(0xFF333333),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Profilebottombar(label: '🐶 Pets'),
                  // Example(title: '🐶 Pets'),
                  8.horizontalSpace,
                  const Profilebottombar(label: '🎉 Traditions'),
                ],
              ),
              8.verticalSpace,
              const Row(
                children: [
                  Profilebottombar(label: '🥗 Favorite Activities'),
                ],
              ),
            ],
          ),
          32.verticalSpace,
          Text(
            'Add Photos',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          16.verticalSpace,
          const Addicon(),
          32.verticalSpace,
          const Guidelines(),
          32.verticalSpace,
          ElevatedButton(
              onPressed: () {
                if(imageList.isEmpty){
                  Utils.showSnackBar(context, "Please upload at least one image");
                  return;
                }
                //  context.navigateTo(HomeScreen());
                ref.read(progressBarValueProvider3.notifier).state++;
                ref.read(pageControllerProvider3.notifier).state.nextPage(
                    duration: const Duration(microseconds: 500),
                    curve: Curves.bounceIn);
              },
              child: Text(
                'Next',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          32.verticalSpace
        ],
      ),
    );
  }
}
