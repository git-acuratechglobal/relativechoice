
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import '../../../../../core/network/apiend_points.dart';
import '../../../../../core/widgets/network_image_widget.dart';
import '../../../../profile_feature/model/user_model.dart';
import '../../../widgets/user_profile_details_view.dart';
import '../../messages_tab/chatScreen.dart';

class FeedCardWidget extends StatefulWidget {
 const FeedCardWidget({super.key, this.isShowing, required this.userModel});
  final User userModel;
 final bool? isShowing;

  @override
  State<FeedCardWidget> createState() => _FeedCardWidgetState();
}
class _FeedCardWidgetState extends State<FeedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () {
            context.navigateTo(UserProfile(
              canShowBottomButton: false,
              userId: widget.userModel.id ?? 0,
              matchedScore: widget.userModel.roundedAverageScore,
            ));
          },
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: Color(0xFFF4FCFF),
                borderRadius: BorderRadius.circular(20),
                border: GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(colors: [
                      Color(0xFF3EBDE5),
                      Color(0xFFCFEB65),
                    ]))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.verticalSpace,
                Center(
                  child: SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: NetworkImageWidget(
                          backgroundColor: Colors.transparent,
                          imageUrl: ApiEndPoints.imageBaseUrl +
                              widget.userModel.image.toString()),
                    ),
                  ),
                ),

                15.verticalSpace,

                8.verticalSpace,
                Container(
                  padding: EdgeInsets.only(right: 8),
                  height: 50.h,
                  width: 102.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    border: GradientBoxBorder(
                      width: 2,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3EBDE5),
                          Color(0xFFCFEB65),
                        ],
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      7.horizontalSpace,
                      CircularPercentIndicator(
                        radius: 20.0,
                        lineWidth: 3.0,
                        percent: 0.6,
                        // (widget.userModel.roundedAverageScore / 100)
                        //     .clamp(0.0, 1.0),
                        center: Text(
                          '${widget.userModel.roundedAverageScore}%',
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Color(0xFF57C05C),
                        backgroundColor: Color(0xFFDDE5DC),
                        animation: true,
                        animationDuration: 500,
                      ),
                      5.horizontalSpace,
                      Text(
                        'Match',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          widget.userModel.fullName,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      // 15.horizontalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'asset/images/location.png',
                            height: 16,
                            width: 16,
                          ),
                          Text(
                            ' 2.4 miles',
                            style: TextStyle(
                              color: Color(0xFF1A1819),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.isShowing == true)
          Positioned(
            bottom: -7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {},
                //   child: stackContainer(
                //     image: Image.asset(
                //       'asset/images/close-small.png',
                //       height: 24.h,
                //       width: 24.w,
                //     ),
                //     onTap: () {
                //       // context.navigateTo(page)
                //     },
                //   ),
                // ),
                // 14.horizontalSpace,
                Center(
                  child: InkWell(
                    onTap: () {
                      context.navigateTo(ChatScreen());
                    },
                    child: stackContainer(
                       height: 80,
                      width: 80,
                      image: Image.asset(
                        'asset/images/messageicon.png',

                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}



class stackContainer extends StatefulWidget {
  final Image image;
 final  double? height;
  final double? width;
   stackContainer({
    super.key,
    required this.image,
    this.height=60,
    this.width=60
  });

  @override
  State<stackContainer> createState() => _stackContainerState();
}

class _stackContainerState extends State<stackContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: widget.image,
      ),
    );
  }
}