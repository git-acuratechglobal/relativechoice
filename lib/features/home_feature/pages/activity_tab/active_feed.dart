import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/home_feature/pages/activity_tab/widgets/suggested_tab.dart';
import 'package:relative_choice/features/home_feature/pages/activity_tab/widgets/activity_feed_tab.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';

import '../../widgets/bottomsheet_notification.dart';

class ActiveFeed extends ConsumerStatefulWidget {
  const ActiveFeed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActiveFeedState();
}

class _ActiveFeedState extends ConsumerState<ActiveFeed>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final CardSwiperController controller = CardSwiperController();



  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(158),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: appbar(
                userName: user?.user?.firstname ?? "",
              ),
            ),
            Tabbar(
              tabController: tabController,
              label: 'Activity Feed',
              label2: 'Suggested Matches',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ActivityFeedTab(),
          SuggestedTab(),
        ],
      ),
    );
  }
}









class appbar extends StatelessWidget {
  const appbar(
      {super.key, required this.userName, this.backgroundColor = Colors.white});
  final String userName;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        leading: Image.asset(
          'asset/images/r-icon.png',
          height: 36.h,
          width: 36.w,
        ),
        title: Align(
            alignment: Alignment.topLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${getGreetingMessage()}, \n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '${userName.capitalize()}!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            )),
        actions: [
          notification(),
        ]);
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}

class Tabbar extends StatefulWidget {
  final TabController tabController;
  final String label;
  final String label2;

  Tabbar({
    super.key,
    required this.tabController,
    required this.label,
    required this.label2,
  });

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0.sp,
      height: 44.0.sp,
      decoration: ShapeDecoration(
        color: Color(0xFFF4FCFF),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          borderRadius: BorderRadius.circular(46),
        ),
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: widget.tabController,
        tabs: [
          TabContainer(
            title: widget.label,
            style: TextStyle(
              color: Colors.black,
            ),
            isSelected: selectedTab == 0,
          ),
          TabContainer(
            title: widget.label2,
            style: TextStyle(color: Colors.black),
            isSelected: selectedTab == 1,
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

class TabContainer extends StatelessWidget {
  final String title;
  final TextStyle style;
  final bool isSelected;

  const TabContainer({
    super.key,
    required this.title,
    required this.style,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 0.5.sw,
      height: 34.sp,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56.sp),
            side: isSelected
                ? BorderSide(
                width: 1, color: Color.fromARGB(255, 240, 239, 239))
                : BorderSide(width: 1, color: Colors.transparent)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.black : Color(0xFF777777),
          ),
        ),
      ),
    );
  }
}


