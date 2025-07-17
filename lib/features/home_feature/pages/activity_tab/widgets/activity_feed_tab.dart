import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:relative_choice/features/home_feature/models/daily_tip_model.dart';
import '../../../../../core/network/apiend_points.dart';
import '../../../../../core/widgets/asyncwidget.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/network_image_widget.dart';
import '../../../../profile_feature/model/user_model.dart';
import '../../../providers/activity_provider/activity_provider.dart';
import 'activity_feed_card_widget.dart';

class ActivityFeedTab extends ConsumerStatefulWidget {
  const ActivityFeedTab({super.key});

  @override
  ConsumerState createState() => _ActivityFeedTabState();
}

class _ActivityFeedTabState extends ConsumerState<ActivityFeedTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Color(0xFFCFEB65),
        onRefresh: () async => ref.refresh(activityTabDataProvider),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: AsyncWidget(
              onRetry: () => ref.invalidate(activityTabDataProvider),
              value: ref.watch(activityTabDataProvider),
              data: (activeFeed) {
                if (activeFeed.matchedPeoplesList.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: EmptyWidget(
                          message: "No Peoples Found!",
                          onPressed: () =>
                              ref.refresh(activityTabDataProvider)),
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 500,
                        width: 315.w,
                        child: CardSwiper(
                          numberOfCardsDisplayed:
                              (activeFeed.matchedPeoplesList.length == 1
                                  ? 1
                                  : 2),
                          controller: CardSwiperController(),
                          backCardOffset: Offset(45, 0),
                          cardBuilder: (
                            context,
                            index,
                            horizontalThresholdPercentage,
                            verticalThresholdPercentage,
                          ) {
                            bool isShowing = currentIndex == index;
                            final userModel =
                                activeFeed.matchedPeoplesList[index];
                            return FeedCardWidget(
                              userModel: userModel,
                              isShowing: isShowing,
                            );
                          },
                          allowedSwipeDirection:
                              AllowedSwipeDirection.symmetric(
                            horizontal: true,
                          ),
                          cardsCount: activeFeed.matchedPeoplesList.length,
                          onSwipe: (int a, int? b, c) {
                            setState(() {
                              currentIndex = b!;
                            });
                            return true;
                          },
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    //***DailyTip widget***////

                    _DailyTipsWidget(
                      dailyTips: activeFeed.dailyTips,
                    ),

                    32.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'For you',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          24.verticalSpace,
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: activeFeed.usersShowcaseImages.length,
                            // Use the length of the list
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16),
                            // Separation between items
                            itemBuilder: (context, index) {
                              final user =
                                  activeFeed.usersShowcaseImages[index];

                              return ActiveFeedContainer(
                                user: user,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    24.verticalSpace,
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class _DailyTipsWidget extends StatefulWidget {
  const _DailyTipsWidget({required this.dailyTips});
  final List<DailyTipModel> dailyTips;
  @override
  State<_DailyTipsWidget> createState() => _DailyTipsWidgetState();
}

class _DailyTipsWidgetState extends State<_DailyTipsWidget> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;
  bool isForward = true;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    if (widget.dailyTips.isEmpty) return;
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      final nextPage = _pageController.page!.round() + 1;
      if (nextPage < widget.dailyTips.length) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    if (widget.dailyTips.isNotEmpty) {
      _pageController.dispose();
      _timer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF6FFF4),
          border: Border.all(width: 1, color: const Color(0xFF57C05C)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 28.sp,
                    width: 102.sp,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xFF43BEE1), Color(0xFFCEEB66)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'DAILY TIPS',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 4.h,
                  width: 100.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.dailyTips.length,
                    itemBuilder: (context, index) {
                      final bool isSelected = currentPageIndex == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 4.h,
                        width: isSelected ? 20.w : 12.w,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF005FF2)
                              : const Color(0xFFDEDEDE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => 5.horizontalSpace,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            AspectRatio(
              aspectRatio: 2.3,
              child: widget.dailyTips.isEmpty
                  ? Center(child: Text("No Daily Tips Available"))
                  : PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      itemCount: widget.dailyTips.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                maxLines: 1,
                                widget.dailyTips[index].title ?? "",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800),
                              ),
                              3.verticalSpace,
                              AutoSizeText(
                                minFontSize: 14,
                                widget.dailyTips[index].content ?? "",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF777777),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveFeedContainer extends ConsumerStatefulWidget {
  final User user;

  const ActiveFeedContainer({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActiveFeedContainerState();
}

class _ActiveFeedContainerState extends ConsumerState<ActiveFeedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFF4FCFF),
            border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(colors: [
                  Color(0xFF3EBDE5),
                  Color(0xFFCFEB65),
                ]))),
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: ClipOval(
                  child: NetworkImageWidget(
                      imageUrl:
                          "${ApiEndPoints.imageBaseUrl}${widget.user.image}"),
                ),
              ),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.fullName,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1819)),
                  ),
                  // Text(
                  //   widget.location,
                  //   style: TextStyle(
                  //     fontSize: 9.sp,
                  //     fontWeight: FontWeight.w400,
                  //     color: Color(0xFF1A1819),
                  //   ),
                  // )
                ],
              ),
              // Spacer(),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              //   //width: 90.w,
              //   height: 40.h,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(40),
              //       color: Colors.white,
              //       border: GradientBoxBorder(
              //           width: 1,
              //           gradient: LinearGradient(colors: [
              //             Color(0xFF3EBDE5),
              //             Color(0xFFCFEB65),
              //           ]))),
              //   child: Center(
              //       child: Text(
              //     widget.title2,
              //     style:
              //         TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              //   )),
              // ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              SizedBox(
                height: 64.h,
                width: 64.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: NetworkImageWidget(
                      imageUrl:
                          "${ApiEndPoints.imageBaseUrl}${widget.user.randomShowcaseImage?.image}"),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  widget.user.randomShowcaseImage?.caption ?? "",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF777777)),
                ),
              ),
            ],
          )
        ]));
  }
}
