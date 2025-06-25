import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/features/profile_feature/pages/profile_picture.dart';

import '../../../core/widgets/customWidgets.dart';

class ReadyToUpload extends ConsumerStatefulWidget {
  const ReadyToUpload({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReadyToUploadState();
}

class _ReadyToUploadState extends ConsumerState<ReadyToUpload> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Ready to Upload',
              text2: "You're ready to upload your photos!"),
          32.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 31, vertical: 31),
            //height: 336.h,
            width: 327.w,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color:  Color(0xFFDFDFDF), width: 2),
                ),
                color: Color(0xFFF8F8F8),
                shadows: [
                  BoxShadow(
                    color: Color(0xFFDFDFDF),
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    spreadRadius: 4,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //24.verticalSpace,
                Text(
                  '📁',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                UploadContainer(
                    text1: 'Choose up to ',
                    text2: 'six photos ',
                    text3: 'from your device.'),
                24.verticalSpace,
                Text(
                  '✏️ ',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                UploadContainer(
                    text1: 'Add optional ',
                    text2: 'captions',
                    text3: ' for each photo.'),
                24.verticalSpace,
                Text(
                  '🙌  ',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                UploadContainer(
                    text1: 'Blur faces for ',
                    text2: 'privacy',
                    text3: ' if needed.')
              ],
            ),
          ),
          32.verticalSpace,
          Text(
            'You can update or replace photos later.',
            style: TextStyle(
              color: Color(0xFF777777),
              fontSize: 12,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
          32.verticalSpace,
          Guidelines(), 
          24.verticalSpace,
               Align(
                alignment: Alignment.bottomCenter,
                 child: ElevatedButton(
                  onPressed: () {
                    ref.read(progressBarValueProvider3.notifier).state++;
                    ref.read(pageControllerProvider3.notifier).state.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.bounceIn);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                             ),
               ),
               32.verticalSpace
        ],
      ),
    );
  }
}

class UploadContainer extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  const UploadContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  State<UploadContainer> createState() => _UploadContainerState();
}

class _UploadContainerState extends State<UploadContainer> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: widget.text1,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: widget.text2,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: widget.text3,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
