import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:relative_choice/homeScreen.dart/chatScreen.dart';
import 'package:relative_choice/homeScreen.dart/user_profile.dart';
import 'package:relative_choice/navigationextension.dart';

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
          child: InkWell(
            onTap: () {
              context.navigateTo(UserProfile());
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFF4FCFF),
                  border: GradientBoxBorder(
                      width: 2.w,
                      gradient: LinearGradient(colors: [
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
                        decoration: ShapeDecoration(
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
                                widget.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 2.0.sp,
                    child: Image.asset(
                      widget.imagePath,
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
                              color: Color(0xFF1A1819),
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
                            margin: EdgeInsets.only(left: 3),
                            width: 6,
                            height: 6,
                            decoration: ShapeDecoration(
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
        ),
        Positioned(bottom: -13.sp, child: widget.widget),
      ],
    );
  }
}

class LikedislikeIcon extends StatefulWidget {
  const LikedislikeIcon({super.key});

  @override
  State<LikedislikeIcon> createState() => _LikedislikeIconState();
}

class _LikedislikeIconState extends State<LikedislikeIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
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
        16.horizontalSpace,
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
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
        context.navigateTo(Chatscreen());
      },
      child: Container(
        height: 40,
        width: 93,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          shadows: [
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
                color: Color(0xFF57C05C),
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
