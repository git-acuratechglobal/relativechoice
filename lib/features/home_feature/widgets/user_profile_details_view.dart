import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/features/profile_feature/model/user_model.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';
import '../../../core/network/apiend_points.dart';
import '../../../core/services/zipcode_service/zipcode_service.dart';
import '../../../core/widgets/network_image_widget.dart';
import '../pages/activity_tab/widgets/activity_feed_card_widget.dart';
import '../providers/connection_notifier/connection_notifier.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile(
      {super.key,
      required this.userId,
      required this.matchedScore,
      this.canShowBottomButton = true});
  final int userId;
  final double matchedScore;
  final bool canShowBottomButton;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    final connection = ref.read(connectionNotifierProvider.notifier);
    final connectionState = ref.watch(connectionNotifierProvider);
    return Stack(
      children: [
        Scaffold(
            body: AsyncWidget(
                value: ref.watch(
                    getMatchedUserProfileProvider(userId: widget.userId)),
                data: (userModel) {
                  return Container(
                    //  height: 1.sh,
                    //width: 1.sw,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFF5FAE7),
                          Color(0xFFDCF1FD),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              50.verticalSpace,
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        context.pop();
                                      },
                                      child: const BackIcon()),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                        width: 94.w,
                                        // height: 40.h,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'asset/images/locicon.png',
                                              height: 16.h,
                                              width: 16.w,
                                            ),
                                            6.horizontalSpace,
                                            const Text(
                                              '2.5 Km',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1A1819),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              21.verticalSpace,
                              Center(
                                child: SizedBox(
                                  height: 170.h,
                                  width: 170.w,
                                  child: ClipOval(
                                    child: NetworkImageWidget(
                                        backgroundColor: Colors.transparent,
                                        imageUrl: ApiEndPoints.imageBaseUrl +
                                            userModel.user!.image.toString()),
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                userModel.user?.fullName ?? "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              12.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'asset/images/location-2.png',
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                  8.horizontalSpace,
                                  AsyncWidgetB(
                                      wantLoading: false,
                                      provider: getCityStateProvider(
                                          userModel.user?.address ?? ""),
                                      data: (data) {
                                        return Text(
                                          data.address,
                                          style: const TextStyle(
                                            color: Color(0xFF22172A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                              12.verticalSpace,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                height: 66.h,
                                width: 133.w,
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
                                    CircularPercentIndicator(
                                      radius: 25.0,
                                      lineWidth: 3.0,
                                      percent: (widget.matchedScore / 100)
                                          .clamp(0.0, 1.0),
                                      center: Text(
                                        '${widget.matchedScore}%',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: const Color(0xFF57C05C),
                                      backgroundColor: const Color(0xFFDDE5DC),
                                      animation: true,
                                      animationDuration: 500,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'Match',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        12.verticalSpace,
                        DraggableScrollableSheet(
                          controller: sheetController,
                          initialChildSize: 0.40,
                          minChildSize: 0.15,
                          maxChildSize: 1,
                          builder: (BuildContext context, scrollController) {
                            return SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    28.verticalSpace,
                                    Center(
                                        child: Image.asset(
                                      'asset/images/slider.png',
                                      width: 48.w,
                                      height: 5.h,
                                    )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'About me',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          12.verticalSpace,
                                          Wrap(
                                              spacing: 8.0,
                                              runSpacing: 4.0,
                                              children: userModel
                                                  .userOnboarding!.aboutMeTags
                                                  .map((label) =>
                                                      Profilebottombar(
                                                          label: label))
                                                  .toList()),
                                          32.verticalSpace,
                                          if (userModel
                                                  .userOnboarding?.household !=
                                              null) ...[
                                            Text(
                                              'Household',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Profilebottombar(
                                                label: userModel.userOnboarding
                                                        ?.household!
                                                        .capitalize() ??
                                                    ""),
                                          ],
                                          if (userModel.userOnboarding
                                                  ?.householdAdditionalDetail !=
                                              null)
                                            Text(
                                              userModel.userOnboarding
                                                      ?.householdAdditionalDetail ??
                                                  "",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF777777),
                                              ),
                                            ),
                                          32.verticalSpace,
                                          Text(
                                            "Politics",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Profilebottombar(
                                              label: userModel.userOnboarding
                                                      ?.primaryAccountHolderPolitics ??
                                                  ""),
                                          10.verticalSpace,
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 8,
                                      color: Color(0xffF8F8F8),
                                    ),
                                    32.verticalSpace,
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (userModel.userOnboarding !=
                                                  null &&
                                              userModel
                                                  .userOnboarding!
                                                  .partnerBioTags
                                                  .isNotEmpty) ...[
                                            Text(
                                              "Partner’s Bio",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Wrap(
                                              spacing: 8.0,
                                              runSpacing: 4.0,
                                              children: userModel.userOnboarding
                                                      ?.partnerBioTags
                                                      .map((label) =>
                                                          Profilebottombar(
                                                            label: label,
                                                          ))
                                                      .toList() ??
                                                  [],
                                            ),
                                            32.verticalSpace,
                                          ],
                                          if (userModel.userOnboarding !=
                                                  null &&
                                              userModel.userOnboarding!
                                                      .partnerPolitics !=
                                                  null &&
                                              userModel
                                                  .userOnboarding!
                                                  .partnerPolitics!
                                                  .isNotEmpty) ...[
                                            Text(
                                              "Partner’s Politics",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Profilebottombar(
                                                label: userModel.userOnboarding
                                                        ?.partnerPolitics ??
                                                    ""),
                                            32.verticalSpace,
                                            const Divider(
                                              thickness: 8,
                                              color: Color(0xffF8F8F8),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (userModel.userShowcaseImages !=
                                                  null &&
                                              userModel.userShowcaseImages!
                                                  .isNotEmpty) ...[
                                            Text(
                                              "Showcase",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            10.verticalSpace,
                                            ListView.separated(
                                              padding: EdgeInsets.zero,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: userModel
                                                  .userShowcaseImages!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final showCase = userModel
                                                    .userShowcaseImages?[index];
                                                return Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 240.h,
                                                      width: 327.w,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.sp),
                                                        child: NetworkImageWidget(
                                                            imageUrl: ApiEndPoints
                                                                    .imageBaseUrl +
                                                                "${showCase?.image ?? ""}"),
                                                      ),
                                                    ),
                                                    10.verticalSpace,
                                                    Text(
                                                      showCase?.caption ?? "",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            const Color(0xFF777777),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return 10.verticalSpace;
                                              },
                                            ),
                                            10.verticalSpace,
                                          ],
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 8,
                                      color: Color(0xffF8F8F8),
                                    ),
                                    20.verticalSpace,
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          32.verticalSpace,
                                          Text(
                                            "Roles Sought",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: userModel
                                                    .userRelationShipChoices
                                                    ?.roleTags
                                                    .map((label) =>
                                                        Profilebottombar(
                                                          label: label,
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                          32.verticalSpace,
                                          Text(
                                            "Involvement",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: userModel
                                                    .userRelationShipChoices
                                                    ?.involvementTags
                                                    .map((label) =>
                                                        Profilebottombar(
                                                          label: label,
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                          32.verticalSpace,
                                          Text(
                                            "Faith Preferences",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: userModel
                                                    .userRelationShipChoices
                                                    ?.faithTags
                                                    .map((label) =>
                                                        Profilebottombar(
                                                          label: label,
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                          32.verticalSpace,
                                          Text(
                                            "Race and Ethnicity Preferences",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: userModel
                                                    .userRelationShipChoices
                                                    ?.ethnicityTags
                                                    .map((label) =>
                                                        Profilebottombar(
                                                          label: label,
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                          32.verticalSpace,
                                          Text(
                                            "Political Preferences",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: userModel
                                                    .userRelationShipChoices
                                                    ?.politicsTags
                                                    .map((label) =>
                                                        Profilebottombar(
                                                          label: label,
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                          32.verticalSpace,
                                          Text(
                                            "Lifestyle Preferences",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Wrap(
                                            spacing: 8.0,
                                            runSpacing: 4.0,
                                            children: userModel
                                                    .userRelationShipChoices
                                                    ?.lifestyleTags
                                                    .map((label) =>
                                                        Profilebottombar(
                                                          label: label,
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                          32.verticalSpace,
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 8,
                                      color: Color(0xffF8F8F8),
                                    ),
                                    if (widget.canShowBottomButton)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 32),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                connection.removeFromSuggestion(
                                                    userId:
                                                        userModel.user?.id ??
                                                            0);
                                              },
                                              child: stackContainer(
                                                image: Image.asset(
                                                  'asset/images/close-small.png',
                                                  height: 24.h,
                                                  width: 24.w,
                                                ),
                                              ),
                                            ),
                                            24.horizontalSpace,
                                            InkWell(
                                              onTap: () {
                                                connection
                                                    .sendConnectionRequest(
                                                        userId: userModel
                                                                .user?.id ??
                                                            0);
                                              },
                                              child: Container(
                                                height: 84.h,
                                                width: 84.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: const Color(0xFF005FF2),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x33005FF2),
                                                        blurRadius: 10,
                                                        spreadRadius: 1,
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 24,
                                                  ),
                                                  child: Image.asset(
                                                    'asset/images/like.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            24.horizontalSpace,
                                            InkWell(
                                              onTap: () {
                                                connection.addToMayBeList(
                                                    userId:
                                                        userModel.user?.id ??
                                                            0);
                                              },
                                              child: stackContainer(
                                                image: Image.asset(
                                                  height: 70,
                                                  color: const Color(0xFF005FF2),
                                                  'asset/images/like.png',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    40.verticalSpace,
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                })),
        if (connectionState.isLoading) const PageLoadingWidget()
      ],
    );
  }
}

class Profilebottombar extends StatefulWidget {
  final String label;
  const Profilebottombar({super.key, required this.label});

  @override
  State<Profilebottombar> createState() => _ProfilebottombarState();
}

class _ProfilebottombarState extends State<Profilebottombar> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        widget.label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(
          color: Color(0xFFDEDEDE),
        ),
      ),
    );
  }
}
