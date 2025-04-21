import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relative_choice/Screens%20/onboarding/transation_prompt.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/profile/profile_picture.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class PhotoUpload extends ConsumerStatefulWidget {
  const PhotoUpload({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends ConsumerState<PhotoUpload> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomText(
              text: 'Photo Upload',
              text2:
                  "Upload your photos below and add captions if you'd like."),
          32.verticalSpace,
          Caption(),
          32.verticalSpace,
          Guidelines(),
          32.verticalSpace,
          ElevatedButton(
              onPressed: () {
                context.navigateTo(TransationPrompt());
              },
              child: Text('Submit')),
          32.verticalSpace,
        ],
      ),
    );
  }
}

class Caption extends StatefulWidget {
  const Caption({super.key});

  @override
  State<Caption> createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  final List<Map<String, dynamic>> _imageData = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageData.add({
          'file': File(image.path),
          'caption': TextEditingController(),
        });
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._imageData.asMap().entries.map((entry) {
          int index = entry.key;
          var imageInfo = entry.value;

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
                        imageInfo['file'],
                        height: 99,
                        width: 99,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
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
                    Text(
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
                        decoration: InputDecoration(
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
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
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Caption',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  8.verticalSpace,
                  Container(
                    height: 56.h,
                    width: 170.w,
                    child: TextField(
                      decoration: InputDecoration(
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
