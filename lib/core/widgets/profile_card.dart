import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
     // height: 226.h,
      width: 327.w,
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            19.verticalSpace,
            ListTile(
              leading: Image.asset(
                'asset/images/single2.png',
                height: 40,
                width: 40,
              ),
              title: Text(
                'Individual Account: ',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
              ),
              subtitle: Text(
                'Use a clear photo of yourself.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'asset/images/family1.png',
                height: 40,
                width: 40,
              ),
              title: Text(
                'Couple Account: ',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
              ),
              subtitle: Text(
                'Feature both partners together.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'asset/images/house.png',
                height: 40,
                width: 40,
              ),
              title: Text(
                'Family Account: ',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
              ),
              subtitle: Text(
                'Showcase your entire family.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            19.verticalSpace,
          ],
        ),
      ),
    );
  }
}



final imageListProvider = StateNotifierProvider<ImageListNotifier, List<Map<String, dynamic>>>((ref) {
  return ImageListNotifier();
});

class ImageListNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  ImageListNotifier() : super([]);



  void addImage(Map<String, dynamic> imageData) {
    state = [...state, imageData];
  }

  void removeImage(int index) {
    state = [
      ...state..removeAt(index),
    ];
  }

  void updateCaption(int index, String caption) {
    final updatedImages = List<Map<String, dynamic>>.from(state);
    updatedImages[index]['caption'] = caption;
    state = updatedImages;
  }
}







class Addicon extends ConsumerWidget {
  const   Addicon({super.key});

  Future<void> _pickImage(BuildContext context, WidgetRef ref) async {
    final images = ref.read(imageListProvider);

    if (images.length >= 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum 6 images allowed')),
      );
      return;
    }

    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(limit: 6);

    if ( pickedFiles.isNotEmpty) {
      final remainingSlots = 6 - images.length;
      final selectedImages = pickedFiles.take(remainingSlots).map((pickedFile) {
        return {
          'file': File(pickedFile.path),
          'caption': TextEditingController(),
        };
      }).toList();

      ref.read(imageListProvider.notifier).state = [
        ...images,
        ...selectedImages,
      ];
    }
  }

  // void _removeImage(WidgetRef ref, int index) {
  //   final images = ref.read(imageListProvider.notifier).state;
  //
  //   final updated = List<Map<String, dynamic>>.from(images);
  //   updated.removeAt(index);
  //
  //   ref.read(imageListProvider.notifier).state = updated;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imageListProvider);

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        ...images.asMap().entries.map((entry) {
          int index = entry.key;
          var imageInfo = entry.value; // This contains both the image and its caption controller
          File image = imageInfo['file']; // Extract the file from the map

          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
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
                  onTap: () => ref.read(imageListProvider.notifier).removeImage(index),
                  child: Image.asset(
                    'asset/images/cuticon.png',
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          );
        }),
        if (images.length < 6)
          InkWell(
            onTap: () => _pickImage(context, ref),
            child: Image.asset(
              'asset/images/profile6.png',
              height: 99,
              width: 99,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}

