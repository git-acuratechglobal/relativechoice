import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/homeScreen.dart/profile_screen.dart';
import 'package:relative_choice/profile/profile_picture.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/profile_card.dart';

class Story extends ConsumerStatefulWidget {
  const Story({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryState();
}

class _StoryState extends ConsumerState<Story> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Showcase Your Story',
              text2: 'Add up to six photos to share your story.'),
          24.verticalSpace,
          Text(
            'Example',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: Color(0xFF333333),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Profilebottombar(label: '🐶 Pets'),
                 // Example(title: '🐶 Pets'),
                  8.horizontalSpace,
                  Profilebottombar(label: '🎉 Traditions'),
               
                ],
              ),
              8.verticalSpace,
              Row(
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
       Addicon(),
      
          32.verticalSpace,
          Guidelines(),
       32.verticalSpace,
          ElevatedButton(
              onPressed: () {
              //  context.navigateTo(HomeScreen());
                ref.read(progressBarValueProvider3.notifier).state++;
            ref.read(pageControllerProvider3.notifier).state.nextPage(
                duration: Duration(microseconds: 500),
                curve: Curves.bounceIn);
              },
              child: Text('Next',  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),)),
          32.verticalSpace
        ],
      ),
    );
  }
}
