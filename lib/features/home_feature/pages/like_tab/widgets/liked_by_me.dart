import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/home_feature/providers/connection_notifier/connection_notifier.dart';

import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/sugestedContainer.dart';
import '../../../../profile_feature/model/user_model.dart';
import '../../../providers/like_provider/like_provider.dart';
import '../../../widgets/user_profile_details_view.dart';

class LikedByMeWidget extends ConsumerStatefulWidget {
  const LikedByMeWidget({super.key, required this.likedByMeList});
  final List<User> likedByMeList;
  @override
  ConsumerState createState() => _LikedByMeWidgetState();
}

class _LikedByMeWidgetState extends ConsumerState<LikedByMeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        if (widget.likedByMeList.isNotEmpty)
          GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.72,
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 32,
            ),
            itemCount: widget.likedByMeList.length,
            itemBuilder: (context, index) {
              final user = widget.likedByMeList[index];
              return InkWell(
                onTap: () {
                  context.navigateTo(UserProfile(
                    canShowBottomButton: false,
                    userId: user.user_id ?? 0,
                    matchedScore: user.roundedAverageScore,
                  ));
                },
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: SuggestedContainer(
                    title: user.fullName,
                    imagePath: user.image,
                    subtitle: '1.3 mi away',
                    text: '${user.roundedAverageScore}% Match',
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CrossButton(
                          onCrossIconTap: () {
                            ref
                                .read(connectionNotifierProvider.notifier)
                                .cancelSendRequest(userId: user.id ?? 0);
                          },
                        ),
                        // 8.horizontalSpace,
                        // Chaticon(),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        else
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: EmptyWidget(
                  message: "No Peoples Found!",
                  onPressed: () => ref.refresh(getLikedUserListProvider)),
            ),
          ),
        30.verticalSpace,
      ],
    );
  }
}
