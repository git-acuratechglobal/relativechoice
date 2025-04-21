import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_choice/homeScreen.dart/active_feed.dart';
import 'package:relative_choice/homeScreen.dart/bottomsheet_notification.dart';
import 'package:relative_choice/homeScreen.dart/chatScreen.dart';
import 'package:relative_choice/homeScreen.dart/filter.dart';
import 'package:relative_choice/homeScreen.dart/user_profile.dart';
import 'package:relative_choice/navigationextension.dart';

class Explore extends ConsumerStatefulWidget {
  const Explore({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends ConsumerState<Explore> {
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
        return FilterBottomSheet();
      },
    );
  }

  int currentPageIndex = 0;
  int currentIndex = 0;
  List<Widget> cards = [CardContainer2(), CardContainer2(), CardContainer2()];
  final CardSwiperController controller = CardSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xFFF5FAE7),
              Color(0xFFDCF1FD),
              // Color(0xFFEDFEFF),
            ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreferredSize(
                  preferredSize: Size(1.w, 50.h), child: ExploreAppBar()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    hintText: 'Search....',
                    hintStyle: TextStyle(color: Color(0xFF7777777)),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF7777777)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
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
              SizedBox(
                height: 170,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10));
                  },
                  itemBuilder: (context, index) {
                    return ExploreContainer(
                      imagePath: 'asset/images/person.png',
                      title: 'Vanesss',
                      subtitle: '5.0 mi away',
                      text: '',
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24, right: 24),
                ),
              ),
              24.verticalSpace,
              Container(
                  width: 1.sw,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Near by you',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
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
                      // 14.verticalSpace,
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
                              return CardContainer2(
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
                      24.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 4.h,
                          width: 100.w,
                          child: ListView.separated(
                            //physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: cards.length,
                            itemBuilder: (BuildContext context, int index) {
                              final bool isSelected = currentPageIndex == index;
                              return AnimatedContainer(
                                duration: Duration(microseconds: 500),
                                height: 4.h,
                                width: isSelected ? 20.w : 14.w,
                                decoration: ShapeDecoration(
                                  color: isSelected
                                      ? Color(0xFF005FF2)
                                      : Color(0xFFDEDEDE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return 5.horizontalSpace;
                            },
                          ),
                        ),
                      ),
                      55.verticalSpace,
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreAppBar extends StatefulWidget {
  const ExploreAppBar({super.key});

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
                  Text(
                    'United States',
                    style: TextStyle(
                      color: Color(0xFF22172A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xFF005FF2),
                  )
                ],
              ),
              Text(
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
          actions: [5.horizontalSpace, notification()]),
    );
  }
}

class ExploreContainer extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String text;
  //final Widget widget;

  const ExploreContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.subtitle,
    required this.text,
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
            context.navigateTo(UserProfile());
          },
          child: Container(
            width: 105,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF4FCFF),
                border: GradientBoxBorder(
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
                          color: Color(0xFF57C05C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
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
                Image.asset(
                  widget.imagePath,
                  height: 40,
                  width: 40,
                ),
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
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1A1819),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                    2.horizontalSpace,
                    Container(
                      width: 6,
                      height: 6,
                      decoration: ShapeDecoration(
                        color: Color(0xFF12E398),
                        shape: OvalBorder(),
                      ),
                    )
                  ],
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
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Image.asset('asset/images/close-small.png'),
                  ),
                ),
                6.horizontalSpace,
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
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
          color: Color(0xFFF4FCFF),
          border: GradientBoxBorder(
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
              padding: EdgeInsets.only(
                left: 7,
              ),
              width: 90,
              height: 40,
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
            Text(
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
                          color: Color(0xFF1A1819)),
                    ),
                    Text(
                      'STUTTGART',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1819),
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
class CardContainer2 extends StatefulWidget {
  CardContainer2({super.key, this.isShowing});
  bool? isShowing;
  @override
  State<CardContainer2> createState() => _CardContainer2State();
}

class _CardContainer2State extends State<CardContainer2> {
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
                           
                             title:  AutoSizeText ('Looking for a chosen family to share holidays with...',
                             maxLines: 2,
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.40
                                      
                                    ),
                              ),
                            subtitle: AutoSizeText(
                              maxLines: 2,
                              'Laughter-filled evenings, and create lasting memories together.',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.40
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