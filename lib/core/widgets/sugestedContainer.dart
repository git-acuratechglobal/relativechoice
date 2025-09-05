import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/network_image_widget.dart';

import '../../features/home_feature/pages/messages_tab/chatScreen.dart';
import '../network/apiend_points.dart';

class SuggestedContainer extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String text;
  final Widget widget;

  const SuggestedContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.subtitle,
    required this.text,
    required this.widget,
  });

  @override
  State<SuggestedContainer> createState() => _SuggestedContainerState();
}

class _SuggestedContainerState extends State<SuggestedContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          // height: 210.h,
          // width: 164.w,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF4FCFF),
                border: GradientBoxBorder(
                    width: 2.w,
                    gradient: const LinearGradient(colors: [
                      Color(0xFF3EBDE5),
                      Color(0xFFCFEB65),
                    ]))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  child: AspectRatio(
                    aspectRatio: 4.6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: const ShapeDecoration(
                        color: Color(0xFF57C05C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              widget.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: ClipOval(
                    child: NetworkImageWidget(
                        imageUrl: ApiEndPoints.imageBaseUrl + widget.imagePath),
                  ),
                ),
                Column(
                  children: [
                    10.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 6.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1A1819),
                          ),
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 3),
                          width: 6,
                          height: 6,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF12E398),
                            shape: OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                24.verticalSpace,
              ],
            ),
          ),
        ),
        Positioned(bottom: -13.sp, child: widget.widget),
      ],
    );
  }
}

class LikedislikeIcon2 extends StatefulWidget {
  const LikedislikeIcon2(
      {super.key,
      this.onHeartIconTap,
      this.onCrossIconTap,
      this.onMayBeIconTap});
  final void Function()? onHeartIconTap;
  final void Function()? onCrossIconTap;
  final void Function()? onMayBeIconTap;
  @override
  State<LikedislikeIcon2> createState() => _LikedislikeIcon2State();
}

class _LikedislikeIcon2State extends State<LikedislikeIcon2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        9.horizontalSpace,
        InkWell(
          onTap: widget.onCrossIconTap,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Image.asset('asset/images/close-small.png'),
            ),
          ),
        ),
        16.horizontalSpace,
        InkWell(
          onTap: widget.onHeartIconTap,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFF005FF2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.asset(
                'asset/images/like-2.png',
                color: Colors.white,
              ),
            ),
          ),
        ),
        16.horizontalSpace,
        InkWell(
          onTap: widget.onMayBeIconTap,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.asset(
                'asset/images/like-2.png',
                height: 35,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LikedislikeIcon extends StatefulWidget {
  const LikedislikeIcon({super.key, this.onHeartIconTap, this.onCrossIconTap});
  final void Function()? onHeartIconTap;
  final void Function()? onCrossIconTap;
  @override
  State<LikedislikeIcon> createState() => _LikedislikeIconState();
}

class _LikedislikeIconState extends State<LikedislikeIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.onCrossIconTap,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Image.asset('asset/images/close-small.png'),
            ),
          ),
        ),
        16.horizontalSpace,
        InkWell(
          onTap: widget.onHeartIconTap,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.asset('asset/images/like-2.png'),
            ),
          ),
        )
      ],
    );
  }
}

class Chaticon extends StatefulWidget {
  const Chaticon({super.key});

  @override
  State<Chaticon> createState() => _ChaticonState();
}

class _ChaticonState extends State<Chaticon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigateTo(const ChatScreen(userId: 0,));
      },
      child: Container(
        height: 40,
        width: 93,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/chaticon.png',
              width: 24.w,
              height: 24.h,
            ),
            Text(
              'Chat',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF57C05C),
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CrossButton extends StatelessWidget {
  const CrossButton({super.key, this.onCrossIconTap});
  final void Function()? onCrossIconTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCrossIconTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Image.asset('asset/images/close-small.png'),
        ),
      ),
    );
  }
}
