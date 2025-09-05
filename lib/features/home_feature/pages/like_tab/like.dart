import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/widgets/asyncwidget.dart';
import 'package:relative_choice/features/home_feature/pages/Like_tab/widgets/liked_by_me.dart';
import 'package:relative_choice/features/home_feature/pages/Like_tab/widgets/liked_me.dart';
import 'package:relative_choice/features/home_feature/pages/like_tab/widgets/maybe_widget.dart';
import 'package:relative_choice/features/home_feature/providers/like_provider/like_provider.dart';
import '../../providers/connection_notifier/connection_notifier.dart';
import '../activity_tab/active_feed.dart';
import '../../widgets/bottomsheet_notification.dart';

class Like extends ConsumerStatefulWidget {
  const Like({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikeState();
}

late TabController tabController;

class _LikeState extends ConsumerState<Like>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final connectionState = ref.watch(connectionNotifierProvider);
    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const appbar2(),
                _LikePageTabBar(
                  tabController: tabController,
                  label: 'Liked By Me',
                  label2: 'Liked Me',
                  label3: 'May Be',
                ),
                // 50.verticalSpace,
                // Center(child: Text("No Result found"))
                Expanded(
                    child: AsyncWidget(
                        onRetry: () => ref.refresh(getLikedUserListProvider),
                        value: ref.watch(getLikedUserListProvider),
                        data: (data) {
                          return RefreshIndicator(
                            onRefresh: () async =>
                                ref.refresh(getLikedUserListProvider),
                            child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: tabController,
                                children: [
                                  /// LikedByMe Tab
                                  RefreshIndicator(
                                    color: const Color(0xFFCFEB65),
                                    onRefresh: () async {
                                      ref.invalidate(getLikedUserListProvider);
                                    },
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: LikedByMeWidget(
                                        likedByMeList:
                                            data?.likedByMeTabList ?? [],
                                      ),
                                    ),
                                  ),

                                  /// LikedMe Tab
                                  RefreshIndicator(
                                    color: const Color(0xFFCFEB65),
                                    onRefresh: () async {
                                      ref.invalidate(getLikedUserListProvider);
                                    },
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: LikedMeWidget(
                                        likedMe: data?.likedMeTabList ?? [],
                                      ),
                                    ),
                                  ),

                                  /// Maybe Tab
                                  RefreshIndicator(
                                    color: const Color(0xFFCFEB65),
                                    onRefresh: () async {
                                      ref.invalidate(getLikedUserListProvider);
                                    },
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: MaybeWidget(
                                        likedMe: data?.mayBeTabList ?? [],
                                      ),
                                    ),
                                  ),
                                ]),
                          );
                        }))
              ],
            ),
          ),
        ),
        if (connectionState.isLoading) const PageLoadingWidget()
      ],
    );
  }
}

class appbar2 extends StatefulWidget {
  const appbar2({super.key});

  @override
  State<appbar2> createState() => _appbar2State();
}

class _appbar2State extends State<appbar2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: AppBar(
            automaticallyImplyLeading: false,
            title: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Likes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            actions: const [notification()]));
  }
}

class _LikePageTabBar extends StatefulWidget {
  final TabController tabController;
  final String label;
  final String label2;
  final String label3;
  _LikePageTabBar({
    required this.tabController,
    required this.label,
    required this.label2,
    required this.label3,
  });

  @override
  State<_LikePageTabBar> createState() => _LikePageTabBarState();
}

class _LikePageTabBarState extends State<_LikePageTabBar> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0.sp,
      height: 44.0.sp,
      decoration: ShapeDecoration(
        color: const Color(0xFFF4FCFF),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          borderRadius: BorderRadius.circular(46),
        ),
      ),
      child: TabBar(
        indicatorWeight: 1,
        padding: const EdgeInsets.symmetric(vertical: 2),
        indicatorColor: Colors.transparent,
        controller: widget.tabController,
        tabAlignment: TabAlignment.fill,
        indicator: const BoxDecoration(),
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        tabs: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: TabContainer(
              title: widget.label,
              style: const TextStyle(
                color: Colors.black,
              ),
              isSelected: selectedTab == 0,
            ),
          ),
          TabContainer(
            title: widget.label2,
            style: const TextStyle(color: Colors.black),
            isSelected: selectedTab == 1,
          ),
          TabContainer(
            title: widget.label3,
            style: const TextStyle(color: Colors.black),
            isSelected: selectedTab == 2,
          ),
        ],
        dividerColor: Colors.transparent,
        onTap: (val) {
          setState(() {
            selectedTab = val;
          });
        },
      ),
    );
  }
}
