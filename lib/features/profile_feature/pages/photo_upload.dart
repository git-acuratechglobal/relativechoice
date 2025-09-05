import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/features/profile_feature/pages/profile_picture.dart';
import 'package:relative_choice/features/profile_feature/providers/profile_onboarding_provider.dart';
import '../../../core/utils/appbutton.dart';
import '../../../core/widgets/customWidgets.dart';
import '../../../core/widgets/profile_card.dart';

class PhotoUpload extends ConsumerStatefulWidget {
  const PhotoUpload({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends ConsumerState<PhotoUpload>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pickedImages = ref.watch(imageListProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const CustomText(
              text: 'Photo Upload',
              text2:
                  "Upload your photos below and add captions if you'd like."),
          32.verticalSpace,
          const Caption(),
          32.verticalSpace,
          const Guidelines(),
          32.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(profileOnBoardingProvider).isLoading,
            title: 'Submit',
            onClick: () {
              if (pickedImages.isEmpty) {
                Utils.showSnackBar(context, "Please upload at least one Image");
                return;
              }
              ref
                  .read(profileOnBoardingProvider.notifier)
                  .addShowcaseImages(pickedImages);
            },
          ),
          32.verticalSpace,
        ],
      ),
    );
  }
}

class Caption extends ConsumerStatefulWidget {
  const Caption({super.key});

  @override
  ConsumerState<Caption> createState() => _CaptionState();
}

class _CaptionState extends ConsumerState<Caption> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final images = ref.read(imageListProvider.notifier).state;
    if (images.length >= 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum 6 images allowed')),
      );
      return;
    }
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        images.add({
          'file': File(image.path),
          'caption': TextEditingController(),
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pickedImages = ref.watch(imageListProvider);
    return Column(
      children: [
        ...pickedImages.asMap().entries.map((entry) {
          int index = entry.key;
          var imageInfo = entry.value;
          File image = imageInfo['file']; // Extracting the file
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        image,
                        height: 99,
                        width: 99,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => ref
                            .read(imageListProvider.notifier)
                            .removeImage(index),
                        child: Image.asset(
                          'asset/images/cuticon.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Caption',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    8.verticalSpace,
                    Container(
                      height: 56.h,
                      width: 170.w,
                      child: TextField(
                        controller: imageInfo['caption'],
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF777777),
                          ),
                          hintText: "Please enter your caption",
                          fillColor: Color(0xFFFFFFFF),
                          border: OutlineInputBorder(),
                        ),
                        autofocus: false,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        onTapOutside: (val) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
        if (pickedImages.length < 6)
          InkWell(
            onTap: _pickImage,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'asset/images/profile6.png',
                    height: 99,
                    width: 99,
                    fit: BoxFit.cover,
                  ),
                ),
                // 10.horizontalSpace,
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Add Caption',
                //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                //     ),
                //     8.verticalSpace,
                //     Container(
                //       height: 56.h,
                //       width: 170.w,
                //       child: TextField(
                //         decoration: InputDecoration(
                //           hintStyle: TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.w500,
                //             color: Color(0xFF777777),
                //           ),
                //           hintText: "Please enter your caption",
                //           fillColor: Color(0xFFFFFFFF),
                //           border: OutlineInputBorder(),
                //         ),
                //         autofocus: false,
                //         cursorColor: Colors.black,
                //         keyboardType: TextInputType.text,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
      ],
    );
  }
}
