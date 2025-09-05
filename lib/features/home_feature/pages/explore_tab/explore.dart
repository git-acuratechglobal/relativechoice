import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/services/zipcode_service/zipcode_service.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/core/widgets/empty_widget.dart';
import 'package:relative_choice/core/widgets/network_image_widget.dart';
import 'package:relative_choice/features/home_feature/pages/explore_tab/widgets/filter.dart';
import 'package:relative_choice/features/home_feature/widgets/user_profile_details_view.dart';
import 'package:relative_choice/features/home_feature/providers/connection_notifier/connection_notifier.dart';
import 'package:relative_choice/features/home_feature/providers/get_matching_peoples_provider/matching_peoples_provider.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';
import '../../../../core/network/apiend_points.dart';
import '../../../profile_feature/model/user_model.dart';
import '../../widgets/bottomsheet_notification.dart';
import '../activity_tab/widgets/activity_feed_card_widget.dart';

class Explore extends ConsumerStatefulWidget {
  const Explore({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends ConsumerState<Explore> {
  int currentPageIndex = 0;
  int currentIndex = 0;
  // List<Widget> cards = [CardContainer2(), CardContainer2(), CardContainer2()];
  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(connectionNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData<String?> data when data.value != null:
          final message = data.value;
          Utils.showSnackBar(context, message ?? "");
        case AsyncError error:
          Utils.showSnackBar(context, error.error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectionState = ref.watch(connectionNotifierProvider);
    final connection = ref.read(connectionNotifierProvider.notifier);
    return Stack(
      children: [
        Scaffold(
            body: RefreshIndicator(
                color: const Color(0xFFCFEB65),
                onRefresh: () async {
                  ref.invalidate(getSuggestedMatchesPeoplesListProvider);
                },
                child: AsyncWidget(
                    value: ref.watch(getUserProfileProvider),
                    data: (userProfile) {
                      return AsyncWidget(
                          onRetry: () => ref.invalidate(
                              getSuggestedMatchesPeoplesListProvider),
                          value:
                              ref.watch(getSuggestedMatchesPeoplesListProvider),
                          data: (matchingPeople) {
                            return Container(
                              // height: 1.sh,
                              width: 1.sw,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                    Color(0xFFF5FAE7),
                                    Color(0xFFDCF1FD),
                                    // Color(0xFFEDFEFF),
                                  ])),
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PreferredSize(
                                        preferredSize: Size(1.w, 50.h),
                                        child: ExploreAppBar(
                                          zipcode:
                                              userProfile.user?.address ?? "",
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 10),
                                      child: TextField(
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16),
                                          hintText: 'Search....',
                                          hintStyle: const TextStyle(
                                              color: Color(0xFF7777777)),
                                          prefixIcon: const Icon(Icons.search,
                                              color: Color(0xFF7777777)),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onTapOutside: (val) =>
                                            FocusScope.of(context).unfocus(),
                                      ),
                                    ),
                                    10.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Text(
                                        'Suggested matches',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    10.verticalSpace,
                                    if (matchingPeople
                                        .sortedByUserScore.isEmpty)
                                      const Center(
                                          child: Text("No peoples found"))
                                    else
                                      SizedBox(
                                        height: 170,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10));
                                          },
                                          itemBuilder: (context, index) {
                                            final userModel = matchingPeople
                                                .sortedByUserScore[index];

                                            return ExploreContainer(
                                              userModel: userModel,
                                              imagePath:
                                                  'asset/images/person.png',
                                              title: 'Vanesss',
                                              subtitle: '5.0 mi away',
                                              text: '',
                                              onCrossTap: () {
                                                connection.removeFromSuggestion(
                                                    userId: userModel.id ?? 0);
                                              },
                                              onHeartTap: () {
                                                connection
                                                    .sendConnectionRequest(
                                                        userId:
                                                            userModel.id ?? 0);
                                              },
                                            );
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: matchingPeople
                                              .sortedByUserScore.length,
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(
                                              left: 24, right: 24),
                                        ),
                                      ),
                                    24.verticalSpace,
                                    Container(
                                        width: 1.sw,
                                        decoration: const BoxDecoration(
                                            color: Colors.white),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            32.verticalSpace,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Near by you',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: _bottomsheeet,
                                                    child: Image.asset(
                                                      'asset/images/filter.png',
                                                      height: 42,
                                                      width: 42,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            30.verticalSpace,
                                            if (matchingPeople
                                                .sortedByUserScore.isEmpty) ...[
                                              60.verticalSpace,
                                              Center(
                                                child: EmptyWidget(
                                                    message:
                                                        "No Peoples Found!",
                                                    onPressed: () => ref.refresh(
                                                        getSuggestedMatchesPeoplesListProvider)),
                                              )
                                            ] else
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    // color: Colors.black,
                                                    // height: 500,
                                                    height: 0.45.sh,
                                                    // width: 315.w,
                                                    width: 0.75.sw,
                                                    child: CardSwiper(
                                                      padding: EdgeInsets.zero,
                                                      allowedSwipeDirection: matchingPeople
                                                                  .sortedByUserScore
                                                                  .length ==
                                                              1
                                                          ? const AllowedSwipeDirection
                                                              .none()
                                                          : const AllowedSwipeDirection
                                                              .symmetric(
                                                              horizontal: true),
                                                      numberOfCardsDisplayed:
                                                          (matchingPeople
                                                                      .sortedByUserScore
                                                                      .length ==
                                                                  1
                                                              ? 1
                                                              : 2),
                                                      controller:
                                                          CardSwiperController(),
                                                      backCardOffset:
                                                          const Offset(45, 0),
                                                      cardBuilder: (
                                                        context,
                                                        index,
                                                        horizontalThresholdPercentage,
                                                        verticalThresholdPercentage,
                                                      ) {
                                                        bool isShowing =
                                                            currentIndex ==
                                                                index;
                                                        final userModel =
                                                            matchingPeople
                                                                    .sortedByUserScore[
                                                                index];
                                                        return CardContainer2(
                                                          onHeartTap: () {
                                                            connection.sendConnectionRequest(
                                                                userId: userModel
                                                                        .id ??
                                                                    0);
                                                          },
                                                          onCrossTap: () {
                                                            connection.removeFromSuggestion(
                                                                userId: userModel
                                                                        .id ??
                                                                    0);
                                                          },
                                                          userModel: userModel,
                                                          isShowing: isShowing,
                                                          onMayBeTap: () {
                                                            connection.addToMayBeList(
                                                                userId: userModel
                                                                        .id ??
                                                                    0);
                                                          },
                                                        );
                                                      },
                                                      cardsCount: matchingPeople
                                                          .sortedByUserScore
                                                          .length,
                                                      onSwipe:
                                                          (int a, int? b, c) {
                                                        setState(() {
                                                          currentIndex = b!;
                                                        });
                                                        return true;
                                                      },
                                                    ),
                                                  )),
                                            70.verticalSpace,
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                    }))),
        if (connectionState.isLoading) const PageLoadingWidget()
      ],
    );
  }

  void _bottomsheeet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * .93)),
      builder: (ctx) {
        return const FilterBottomSheet();
      },
    );
  }
}

class ExploreAppBar extends StatefulWidget {
  const ExploreAppBar({super.key, required this.zipcode});
  final String zipcode;
  @override
  State<ExploreAppBar> createState() => _ExploreAppBarState();
}

class _ExploreAppBarState extends State<ExploreAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'asset/images/locationicon.png',
                    width: 12,
                    height: 12,
                  ),
                  AsyncWidgetB(
                      wantLoading: false,
                      provider: getCityStateProvider(widget.zipcode),
                      data: (data) {
                        return Text(
                          data.address,
                          style: const TextStyle(
                            color: Color(0xFF22172A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xFF005FF2),
                  )
                ],
              ),
              const Text(
                'Explore',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: [5.horizontalSpace, const notification()]),
    );
  }
}

class ExploreContainer extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String text;
  //final Widget widget;
  final User userModel;
  final void Function()? onCrossTap;
  final void Function()? onHeartTap;
  const ExploreContainer(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.subtitle,
      required this.text,
      required this.userModel,
      required this.onCrossTap,
      required this.onHeartTap
      // required this.widget,
      });

  @override
  State<ExploreContainer> createState() => _ExploreContainerState();
}

class _ExploreContainerState extends State<ExploreContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            context.navigateTo(UserProfile(
              userId: widget.userModel.id ?? 0,
              matchedScore: widget.userModel.roundedAverageScore,
            ));
          },
          child: Container(
            width: 105,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF4FCFF),
                border: const GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(colors: [
                      Color(0xFF3EBDE5),
                      Color(0xFFCFEB65),
                    ]))),
            child: Column(
              children: [
                7.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      width: 48,
                      height: 24,
                      decoration: BoxDecoration(
                          color: const Color(0xFF57C05C),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        'New',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
                10.verticalSpace,
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: NetworkImageWidget(
                        backgroundColor: Colors.transparent,
                        imageUrl: ApiEndPoints.imageBaseUrl +
                            widget.userModel.image.toString()),
                  ),
                ),
                // Image.asset(
                //   widget.imagePath,
                //   height: 40,
                //   width: 40,
                // ),
                5.verticalSpace,
                Container(
                  height: 14.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1819),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.userModel.fullName,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      2.horizontalSpace,
                      const Icon(
                        size: 9,
                        Icons.circle,
                        color: Color(0xFF12E398),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: (75.w / 2) - (40.w / 2),
            child: Row(
              children: [
                InkWell(
                  onTap: widget.onCrossTap,
                  child: Container(
                    height: 32,
                    width: 32,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Image.asset('asset/images/close-small.png'),
                    ),
                  ),
                ),
                6.horizontalSpace,
                InkWell(
                  onTap: widget.onHeartTap,
                  child: Container(
                    height: 32,
                    width: 32,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Image.asset('asset/images/like-2.png'),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}

class ExploreBox extends ConsumerStatefulWidget {
  const ExploreBox({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreBoxState();
}

class _ExploreBoxState extends ConsumerState<ExploreBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      // height: 343,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF4FCFF),
          border: const GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(colors: [
                Color(0xFF3EBDE5),
                Color(0xFFCFEB65),
              ]))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 7,
              ),
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  border: const GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(colors: [
                        Color(0xFF3EBDE5),
                        Color(0xFFCFEB65),
                      ]))),
              child: Center(
                  child: Text(
                '🏝  Travel',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              )),
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'asset/images/beach.png',
                  height: 126,
                  width: 126,
                )),
            const Text(
              'If you could live\nanywhere in the world, where would you pick?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            20.verticalSpace,
            Row(
              children: [
                Image.asset(
                  'asset/images/chatperson.png',
                  height: 40,
                  width: 40,
                ),
                8.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Miranda Kehlani',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A1819)),
                    ),
                    Text(
                      'STUTTGART',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF1A1819),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardContainer2 extends ConsumerStatefulWidget {
  CardContainer2(
      {super.key,
      this.isShowing,
      required this.userModel,
      required this.onHeartTap,
      required this.onCrossTap,
      required this.onMayBeTap});
  bool? isShowing;
  final User userModel;
  final void Function() onHeartTap;
  final void Function() onCrossTap;
  final void Function() onMayBeTap;
  @override
  ConsumerState<CardContainer2> createState() => _CardContainer2State();
}

class _CardContainer2State extends ConsumerState<CardContainer2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            context.navigateTo(UserProfile(
              userId: widget.userModel.id ?? 0,
              matchedScore: widget.userModel.roundedAverageScore,
            ));
          },
          child: Container(
            // height: 400,
            height: 0.41.sh,
            decoration: BoxDecoration(
                color: const Color(0xFFF4FCFF),
                borderRadius: BorderRadius.circular(20),
                border: const GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(colors: [
                      Color(0xFF3EBDE5),
                      Color(0xFFCFEB65),
                    ]))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                24.verticalSpace,
                // Center(
                //   child: Container(
                //       width: 250.w,
                //       //  height: 91.h,
                //       decoration: ShapeDecoration(
                //         color: Colors.white,
                //         shape: RoundedRectangleBorder(
                //             side: BorderSide(
                //                 width: 1, color: Color(0xFFDDDDDD)),
                //             borderRadius: BorderRadius.circular(20)),
                //       ),
                //       child: ListTile(
                //           title: AutoSizeText(
                //             'Looking for a chosen family to share holidays with...',
                //             maxLines: 2,
                //             style: TextStyle(
                //                 color: Color(0xFF777777),
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w400,
                //                 height: 1.40),
                //           ),
                //           subtitle: AutoSizeText(
                //             maxLines: 2,
                //             'Laughter-filled evenings, and create lasting memories together.',
                //             style: TextStyle(
                //                 fontSize: 12.sp,
                //                 fontWeight: FontWeight.w700,
                //                 height: 1.40),
                //           ),
                //           trailing: Container(
                //               decoration: ShapeDecoration(
                //                 color: Colors.white,
                //                 shape: RoundedRectangleBorder(
                //                     side: BorderSide(
                //                         width: 1, color: Color(0xFFDDDDDD)),
                //                     borderRadius: BorderRadius.circular(20)),
                //               ),
                //               child: Image.asset(
                //                 'asset/images/dislike1.png',
                //                 height: 40,
                //                 width: 40,
                //               )))),
                // ),
                8.verticalSpace,
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    height: 50.h,
                    width: 102.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: const GradientBoxBorder(
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
                          percent: (widget.userModel.roundedAverageScore / 100)
                              .clamp(0.0, 1.0),
                          center: Text(
                            '${widget.userModel.roundedAverageScore}%',
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: const Color(0xFF57C05C),
                          backgroundColor: const Color(0xFFDDE5DC),
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
                          const Text(
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
            bottom: -0.01.sh,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: widget.onCrossTap,
                    child: stackContainer(
                      image: Image.asset(
                        'asset/images/close-small.png',
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  Container(
                    height: 84.h,
                    width: 84.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF005FF2),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33005FF2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: InkWell(
                        onTap: widget.onHeartTap,
                        child: Image.asset(
                          'asset/images/like.png',
                        ),
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  InkWell(
                      onTap: widget.onMayBeTap,
                      child: stackContainer(
                        image: Image.asset(
                          height: 70,
                          color: const Color(0xFF005FF2),
                          'asset/images/like.png',
                        ),
                      )),
                ],
              ),
            ),
          )
      ],
    );
  }
}
