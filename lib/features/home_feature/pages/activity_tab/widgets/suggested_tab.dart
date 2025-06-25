import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/core/widgets/empty_widget.dart';
import 'package:relative_choice/core/widgets/sugestedContainer.dart';
import 'package:relative_choice/features/home_feature/providers/activity_provider/activity_provider.dart';
import 'package:relative_choice/features/home_feature/providers/connection_notifier/connection_notifier.dart';
import 'package:relative_choice/features/profile_feature/model/user_model.dart';

import '../../../widgets/user_profile_details_view.dart';

class SuggestedTab extends ConsumerStatefulWidget {
  const SuggestedTab({
    super.key,
  });

  @override
  ConsumerState<SuggestedTab> createState() => _SuggestedTabState();
}

class _SuggestedTabState extends ConsumerState<SuggestedTab> {
  final List<Map<String, String>> suggestions = [
    {
      'title': 'Eddie',
      'imagePath': 'asset/images/person.png',
      'subtitle': '1.3 mi away',
      'text': '100% Match'
    },
    {
      'title': 'Alice',
      'imagePath': 'asset/images/person.png',
      'subtitle': '2.0 mi away',
      'text': '90% Match'
    },
    {
      'title': 'John',
      'imagePath': 'asset/images/person.png',
      'subtitle': '3.0 mi away',
      'text': '85% Match'
    },
    {
      'title': 'Sophie',
      'imagePath': 'asset/images/person.png',
      'subtitle': '5.0 mi away',
      'text': '80% Match'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final isConnectionLoadingState=ref.watch(connectionNotifierProvider).isLoading;
    return Stack(
      children: [
        Scaffold(
          body: RefreshIndicator(
            color: Color(0xFFCFEB65),
            onRefresh: () async => ref.refresh(activityTabDataProvider),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: AsyncWidget(
                  value: ref.watch(activityTabDataProvider),
                  data: (data) {
                    final suggestedData = data.suggestedMatchesList;
                    return suggestedData.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Center(
                              child: EmptyWidget(
                                  message: "No Peoples Found!",
                                  onPressed: () =>
                                      ref.refresh(activityTabDataProvider)),
                            ),
                          )
                        : RefreshIndicator(
                            color: Color(0xFFCFEB65),
                            onRefresh: () async =>
                                ref.refresh(activityTabDataProvider),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 10),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Your Matches ',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${suggestedData.length}',
                                          style: TextStyle(
                                            color: Color(0xFF005FF2),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 10),
                                  child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.only(top: 24),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.72,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 14,
                                        mainAxisSpacing: 30,
                                      ),
                                      itemCount: suggestedData.length,
                                      itemBuilder: (context, index) {
                                        var suggestion = suggestedData[index];
                                        return InkWell(
                                          onTap: () {
                                            context.navigateTo(UserProfile(
                                              userId: suggestion.id ?? 0,
                                              matchedScore: suggestion.roundedAverageScore,
                                            ));
                                          },
                                          child: SuggestedContainer(
                                            title: suggestion.fullName,
                                            imagePath: suggestion.image,
                                            subtitle: "3.0 mi away",
                                            text: "${suggestion.roundedAverageScore}% Match",
                                            widget: LikedislikeIcon2(
                                              onHeartIconTap: () {
                                                ref
                                                    .read(connectionNotifierProvider
                                                        .notifier)
                                                    .sendConnectionRequest(
                                                        userId: suggestion.id ?? 0);
                                              },
                                              onCrossIconTap: () {
                                                ref
                                                    .read(connectionNotifierProvider
                                                        .notifier)
                                                    .removeFromSuggestion(
                                                        userId: suggestion.id ?? 0);
                                              },
                                              onMayBeIconTap: () {
                                                ref
                                                    .read(connectionNotifierProvider
                                                    .notifier)
                                                    .addToMayBeList(
                                                    userId: suggestion.id ?? 0);
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                // 24.verticalSpace,
                                // ActiveContainer()
                              ],
                            ),
                          );
                  }),
            ),
          ),
        ),
        if(isConnectionLoadingState) PageLoadingWidget()
      ],
    );
  }
}
