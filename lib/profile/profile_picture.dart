import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/profile_card.dart';

class ProfilePicture extends ConsumerStatefulWidget {
  const ProfilePicture({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends ConsumerState<ProfilePicture> {
  File? selectedImage;
  Future<void> pickImage() async {
    showModalBottomSheet(
      backgroundColor: Color(0xFFF6FFF4),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: Color(0xFF333333),
              ),
              title: Text(
                'Take Photo',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                await _pickImageFromSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo, color: Color(0xFF333333)),
              title: Text(
                'Choose from Gallery',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF333333),
                      fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                await _pickImageFromSource(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromSource(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 80);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);

      ref.read(profilePictureProvider.notifier).state = imageFile;

      setState(() {
        selectedImage = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(profilePictureProvider);
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
              child: selectedImage != null
                  ? ClipOval(
                      child: Image.file(
                        selectedImage,
                        fit: BoxFit.cover,
                      ),
                    )
                  : InkWell(
                      onTap: pickImage,
                      child: Image.asset('asset/images/profile.png')),
            ),
          ),
          10.verticalSpace,
          Center(
            child: InkWell(
              onTap: pickImage,
              child: Text(
                selectedImage != null
                    ? 'Change Profile Picture'
                    : 'Add Profile Picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF005FF2),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                  height: 1.30,
                ),
              ),
            ),
          ),
          24.verticalSpace,
          Guidelines(),
          32.verticalSpace,
          ElevatedButton(
              onPressed: () {
                ref.read(progressBarValueProvider3.notifier).state++;
                ref.read(pageControllerProvider3.notifier).state.nextPage(
                    duration: Duration(microseconds: 500),
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

class Guidelines extends StatelessWidget {
  const Guidelines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Please review our image guidelines prior to uploading your photos.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        Center(
          child: Text(
            'Photo Guidelines.',
            style: TextStyle(
                color: Color(0xFF005FF2),
                fontSize: 12.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}

final profilePictureProvider = StateProvider<File?>((ref) => null);
