import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';

import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/sugestedContainer.dart';
import '../../../../profile_feature/model/user_model.dart';
import '../../../providers/connection_notifier/connection_notifier.dart';
import '../../../providers/like_provider/like_provider.dart';
import '../../../widgets/user_profile_details_view.dart';

class MaybeWidget extends ConsumerStatefulWidget {
  const MaybeWidget({super.key, required this.likedMe});
  final List<User> likedMe;
  @override
  ConsumerState createState() => _MaybeWidgetState();
}

class _MaybeWidgetState extends ConsumerState<MaybeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        if (widget.likedMe.isNotEmpty)
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
            itemCount: widget.likedMe.length,
            itemBuilder: (context, index) {
              var likedMe = widget.likedMe[index];
              return InkWell(
                onTap: (){
                  context.navigateTo(UserProfile(
                    userId: likedMe.id ?? 0,
                    matchedScore: likedMe.roundedAverageScore,
                  ));
                },
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: SuggestedContainer(
                    title: likedMe.fullName,
                    imagePath: likedMe.image,
                    subtitle: '1.3 mi away',
                    text: '${likedMe.roundedAverageScore}% Match',
                    widget: LikedislikeIcon(
                      onHeartIconTap: () {
                        ref
                            .read(connectionNotifierProvider.notifier)
                            .sendConnectionRequest(userId: likedMe.id ?? 0);
                      },
                      onCrossIconTap: () {
                        ref
                            .read(connectionNotifierProvider.notifier)
                            .removeFromSuggestion(userId: likedMe.id ?? 0);
                      },

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
