import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/core/widgets/profile_card.dart';
import 'package:relative_choice/features/profile_feature/pages/profile_picture.dart';

import '../../../core/widgets/customWidgets.dart';

class ProfilePictureChange extends ConsumerStatefulWidget {
  const ProfilePictureChange({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePictureChangeState();
}

class _ProfilePictureChangeState extends ConsumerState<ProfilePictureChange> {

     File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Profile Picture',
              text2:
                  'Your profile picture helps others connect with you. Make it count!'),
          32.verticalSpace,
          ProfileCard(),
          32.verticalSpace,
            Center(
            child: SizedBox(
                height: 182.h,
                width: 182.w,
                child:  selectedImage != null
                  ? ClipOval(
                    child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                  )
                  : InkWell(
                    onTap: pickImage,
                    child: Image.asset('asset/images/profile.png')),),
          ),
          10.verticalSpace,
          if(selectedImage != null)
          Center(
            child: InkWell(
              onTap: pickImage,
              child: Text(
                'Add Profile Picture',
                style: TextStyle(
                  color: Color(0xFF005FF2),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
               24.verticalSpace,
        Guidelines(),
          24.verticalSpace,
          ElevatedButton(
              onPressed: () {
                ref.read(progressBarValueProvider3.notifier).state++;
                ref.read(pageControllerProvider3.notifier).state.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.bounceIn);
              },
              child: Text('Next',  style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),)),
            32.verticalSpace,
        ],
      ),
    );
  }
}
