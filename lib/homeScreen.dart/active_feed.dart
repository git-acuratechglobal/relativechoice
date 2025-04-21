//import 'dart:async';

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_choice/homeScreen.dart/bottomsheet_notification.dart';
import 'package:relative_choice/homeScreen.dart/chatScreen.dart';
import 'package:relative_choice/homeScreen.dart/suggestedScreen.dart';
import 'package:relative_choice/homeScreen.dart/user_profile.dart';
import 'package:relative_choice/navigationextension.dart';

class ActiveFeed extends ConsumerStatefulWidget {
  const ActiveFeed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActiveFeedState();
}

class _ActiveFeedState extends ConsumerState<ActiveFeed>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> cards = [CardContainer(), CardContainer(), CardContainer()];
  final CardSwiperController controller = CardSwiperController();

List<Map<String, dynamic>> activeFeed = [
   {
    'title': 'Miranda Kehlani',
    'location': 'NEW YORK',
    'title2': '🏝 Travel',
    'title3': 'If you could live anywhere in the world, where would you pick?',
    'image': 'asset/images/beach.png',
  },
   {
    'title': 'Brandon Aminoff',
    'location': 'CHICAGO',
    'title2': '🏈️ Football',
    'title3': 'Who do you think will win this year’s Super Bowl?',
    'image': 'asset/images/football.png',
  },
    {
    'title': 'Miranda Kehlani',
    'location': 'NEW YORK',
    'title2': '🏝 Travel',
    'title3': 'If you could live anywhere in the world, where would you pick?',
    'image': 'asset/images/beach.png',
  },
   {
    'title': 'Brandon Aminoff',
    'location': 'CHICAGO',
    'title2': '🏈️ Football',
    'title3': 'Who do you think will win this year’s Super Bowl?',
    'image': 'asset/images/football.png',
  },
  {
    'title': 'Miranda Kehlani',
    'location': 'NEW YORK',
    'title2': '🏝 Travel',
    'title3': 'If you could live anywhere in the world, where would you pick?',
    'image': 'asset/images/beach.png',
  },
];
  int currentIndex = 0;
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(158),
        child: Column(
          children: [
            appbar(),
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
          _buildActivityFeed(),
          Suggested(tabController: tabController),
        ],
      ),
    );
  }

  Widget _buildActivityFeed() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 500,
              width: 315.w,
              child: CardSwiper(
                controller: CardSwiperController(),
                backCardOffset: Offset(45, 0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) {
                  bool isShowing = currentIndex == index;
                  return CardContainer(
                    isShowing: isShowing,
                  );
                },
                allowedSwipeDirection: AllowedSwipeDirection.only(
                  right: true,
                  left: true,
                ),
                cardsCount: cards.length,
                onSwipe: (int a, int? b, c) {
                  setState(() {
                    currentIndex = b!;
                  });
                  return true;
                },
              ),
            ),
          ),
          10.verticalSpace,
          ActiveContainer(),
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
  itemCount: activeFeed.length,  // Use the length of the list
  separatorBuilder: (context, index) => SizedBox(height: 16),  // Separation between items
  itemBuilder: (context, index) {
    final feed = activeFeed[index];

    return activefeedContainer(
      feed['title'],
      feed['location'] ,
      feed['title2'],
      feed['title3'] ,
      feed['image'] ,
    );
  },
)

              ],
            ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CardContainer extends StatefulWidget {
  CardContainer({super.key, this.isShowing});
  bool? isShowing;
  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              context.navigateTo(UserProfile());
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Center(
                    child: Image.asset(
                      'asset/images/person.png',
                      height: 100.h,
                      width: 100.w,
                    ),
                  ),
                  24.verticalSpace,
                  Center(
                    child: Container(
                        width: 250.w,
                        //  height: 91.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFDDDDDD)),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: ListTile(
                            title: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'New Message from ',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Wilson Fills',
                                    style: TextStyle(
                                      color: Color(0xFF005FF2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Text(
                              'Hii there! , I have seen your profile. Can we talk here?',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            trailing: Container(
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFFDDDDDD)),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                child: Image.asset(
                                  'asset/images/dislike1.png',
                                  height: 40,
                                  width: 40,
                                )))),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          'Wilson Fills',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        ),
                        15.horizontalSpace,
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          height: 50.h,
                        //  width: 92.w,
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
                                radius: 19.0,
                                lineWidth: 3.0,
                                percent: 0.80,
                                center: Text(
                                  '80%',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Color(0xFF57C05C),
                                backgroundColor: Color(0xFFDDE5DC),
                                animation: true,
                                animationDuration: 2000,
                              ),
                              5.horizontalSpace,
                              Text(
                                'Match',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
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
                  )
                ],
              ),
            ),
          ),
          if (widget.isShowing == true)
            Positioned(
              bottom: -1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                       
                      },
                      child: stackContainer(
                        image: Image.asset(
                          'asset/images/close-small.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                        onTap: () {
                          // context.navigateTo(page)
                        },
                      ),
                    ),
                    14.horizontalSpace,
                    InkWell(
                      onTap: () {
                         context.navigateTo(Chatscreen());
                      },
                      child: stackContainer(
                        image: Image.asset(
                          'asset/images/messageicon.png',
                          height: 26,
                          width: 26,
                        ),
                        onTap: () {},
                      ),
                    ),
                    14.horizontalSpace,
                    InkWell(
                      onTap: () {
                      
                      },
                      child: Container(
                        height: 84.h,
                        width: 84.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF005FF2),
                            boxShadow: [
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
                          child: Image.asset(
                            'asset/images/like.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ActiveContainer extends StatefulWidget {
  const ActiveContainer({super.key});

  @override
  State<ActiveContainer> createState() => _ActiveContainerState();
}

class _ActiveContainerState extends State<ActiveContainer> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;
  bool isForward = true;

  final List<String> titles = [
    'It’s a great day to connect!',
    'Find someone new today!',
    'Start a chat now!',
  ];

  final List<String> subtitles = [
    'Message one of your matches now.',
    'Discover exciting connections.',
    'Don’t wait, send a message!',
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (!mounted)
        return; // Ensure widget is still mounted before updating state
      setState(() {
        if (isForward) {
          if (currentPageIndex < titles.length - 1) {
            currentPageIndex++;
          } else {
            isForward = false;
            currentPageIndex--;
          }
        } else {
          if (currentPageIndex > 0) {
            currentPageIndex--;
          } else {
            isForward = true;
            currentPageIndex++;
          }
        }
        _pageController.animateToPage(
          currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
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
                    itemCount: titles.length,
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
              aspectRatio: 5.0,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          titles[index],
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w800),
                        ),
                        3.verticalSpace,
                        AutoSizeText(
                    maxLines: 1,
                          subtitles[index],
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

class stackContainer extends StatefulWidget {
  final Image image;
  final Function() onTap;
  const stackContainer({super.key, required this.image, required this.onTap});

  @override
  State<stackContainer> createState() => _stackContainerState();
}

class _stackContainerState extends State<stackContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 56.w,
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

class appbar extends StatelessWidget {
  const appbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: AppBar(
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
                        text: 'Good Morning, \n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'John!',
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
            ]));
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
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
              isSelected: widget.tabController.index == 0,
            ),
            TabContainer(
              title: widget.label2,
              style: TextStyle(color: Colors.black),
              isSelected: widget.tabController.index == 1,
            ),
          ],
          dividerColor: Colors.transparent,
        ),
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
      width: 0.5.sw,
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
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.black : Color(0xFF777777),
          ),
        ),
      ),
    );
  }
}

class activefeedContainer extends ConsumerStatefulWidget {
  final String title;
  final String location;
  final String title2;
  final String title3;
  final String image;
  const activefeedContainer(this.title, this.location, this.title2, this.title3, this.image, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _activefeedContainerState();
}

class _activefeedContainerState extends ConsumerState<activefeedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //width: 327.w,
        //height: 153.h,
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
              Image.asset(
                'asset/images/chatperson.png',
                height: 40.h,
                width: 40.w,
              ),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   widget.title,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1819)),
                  ),
                  Text(
                widget.location,
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1819),
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //width: 90.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(colors: [
                          Color(0xFF3EBDE5),
                          Color(0xFFCFEB65),
                        ]))),
                child: Center(
                    child: Text(
                widget.title2,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                )),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Image.asset(
                widget.image,
                height: 64.h,
                width: 64.w,
              ),
              Expanded(
                child: Text(
                  widget.title3,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1819)),
                ),
              ),
            ],
          )
        ]));
  }
}
