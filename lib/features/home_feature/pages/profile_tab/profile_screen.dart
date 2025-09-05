import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/features/profile_feature/model/user_model.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';

import '../../../../core/network/apiend_points.dart';
import '../../../../core/services/zipcode_service/zipcode_service.dart';
import '../../../../core/widgets/network_image_widget.dart';
import '../../widgets/bottomsheet_notification.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  List<String> label = [
    '👥 Couple',
    '🙏 Judaism',
    '👤 Asian',
    '👤 Pipe',
    "🎓 Bachelor's Degree",
    '🚬 Cigarettes',
    "🍷 Occasionally",
    '🐾 Cats',
    "🐾 Reptiles",
    "👦 1 Children",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: AsyncWidget(
            onRetry: () async => ref.refresh(getUserProfileProvider),
            value: ref.watch(getUserProfileProvider),
            data: (user) {
              return Stack(
                children: [
                  Column(
                    children: [
                      50.verticalSpace,
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: notification())),
                      21.verticalSpace,
                      Center(
                        child: SizedBox(
                          height: 170.h,
                          width: 170.w,
                          child: ClipOval(
                            child: NetworkImageWidget(
                                backgroundColor: Colors.transparent,
                                imageUrl: ApiEndPoints.imageBaseUrl +
                                        user.user?.image),
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        user.user?.fullName ?? "",
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
                              provider: getCityStateProvider(user.user?.address??""),
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
                        ],
                      ),
                      12.verticalSpace,
                    ],
                  ),
                  12.verticalSpace,
                  DraggableScrollableSheet(
                    controller: sheetController,
                    initialChildSize: 0.45,
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                          children: user
                                                  .userOnboarding?.aboutMeTags
                                                  .map((label) =>
                                                      Profilebottombar(
                                                          label: label))
                                                  .toList() ??
                                              [],
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (user.userOnboarding?.household !=
                                          null) ...[
                                        32.verticalSpace,
                                        Text(
                                          'Household',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Profilebottombar(
                                            label: user.userOnboarding
                                                        ?.household !=
                                                    null
                                                ? user.userOnboarding
                                                        ?.household!
                                                        .capitalize() ??
                                                    ""
                                                : ""),
                                      ],
                                      if (user.userOnboarding
                                              ?.householdAdditionalDetail !=
                                          null)
                                        Text(
                                          user.userOnboarding
                                                  ?.householdAdditionalDetail ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF777777),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                32.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Politics",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Profilebottombar(
                                          label: user.userOnboarding
                                                  ?.primaryAccountHolderPolitics ??
                                              ""),
                                    ],
                                  ),
                                ),
                                10.verticalSpace,
                                const Divider(
                                  thickness: 8,
                                  color: Color(0xffF8F8F8),
                                ),
                                20.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (user.userOnboarding?.partnerBioTags !=
                                              null &&
                                          user.userOnboarding!.partnerBioTags
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
                                          children: user.userOnboarding
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
                                      if (user.userOnboarding
                                              ?.partnerPolitics !=
                                          null) ...[
                                        Text(
                                          "Partner’s Politics",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Profilebottombar(
                                            label: user.userOnboarding
                                                    ?.partnerPolitics ??
                                                ""),
                                        24.verticalSpace,
                                      ],
                                      if (user.userOnboarding?.partnerBioTags !=
                                              null &&
                                          user.userOnboarding!.partnerBioTags
                                              .isNotEmpty &&
                                          user.userOnboarding
                                                  ?.partnerPolitics !=
                                              null) ...[
                                        const Divider(
                                          thickness: 8,
                                          color: Color(0xffF8F8F8),
                                        ),
                                        20.verticalSpace,
                                      ]
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (user.userShowcaseImages != null &&
                                          user.userShowcaseImages!
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
                                          itemCount:
                                              user.userShowcaseImages?.length ??
                                                  0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final showCase =
                                                user.userShowcaseImages?[index];
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: 240.h,
                                                  width: 327.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xFF777777),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return 5.verticalSpace;
                                          },
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                24.verticalSpace,
                                const Divider(
                                  thickness: 8,
                                  color: Color(0xffF8F8F8),
                                ),
                                22.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Roles Sought",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Wrap(
                                        spacing: 8.0,
                                        runSpacing: 4.0,
                                        children: user.userRelationShipChoices
                                                ?.roleTags
                                                .map(
                                                    (label) => Profilebottombar(
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
                                        children: user.userRelationShipChoices
                                                ?.involvementTags
                                                .map(
                                                    (label) => Profilebottombar(
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
                                        children: user.userRelationShipChoices
                                                ?.faithTags
                                                .map(
                                                    (label) => Profilebottombar(
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
                                        children: user.userRelationShipChoices
                                                ?.ethnicityTags
                                                .map(
                                                    (label) => Profilebottombar(
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
                                        children: user.userRelationShipChoices
                                                ?.politicsTags
                                                .map(
                                                    (label) => Profilebottombar(
                                                          label: label,
                                                        ))
                                                .toList() ??
                                            [],
                                      ),
                                      32.verticalSpace,
                                      Text(
                                        " Lifestyle Preferences",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Wrap(
                                        spacing: 8.0,
                                        runSpacing: 4.0,
                                        children: user.userRelationShipChoices
                                                ?.lifestyleTags
                                                .map(
                                                    (label) => Profilebottombar(
                                                          label: label,
                                                        ))
                                                .toList() ??
                                            [],
                                      ),
                                      32.verticalSpace,
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
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
