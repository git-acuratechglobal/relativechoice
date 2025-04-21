import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        //  height: 1.sh,
        //width: 1.sw,
        decoration: BoxDecoration(
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  50.verticalSpace,
                  // Row(
                  //   children: [
                  //     InkWell(
                  //         onTap: () {
                  //           context.pop();
                  //         },
                  //         child: BackIcon()),
                  //     Expanded(
                  //       child: Align(
                  //         alignment: Alignment.topRight,
                  //         child: Container(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 10, vertical: 8),
                  //           width: 94.w,
                  //           // height: 40.h,
                  //           decoration: ShapeDecoration(
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(50),
                  //             ),
                  //             color: Colors.white,
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Image.asset(
                  //                 'asset/images/locicon.png',
                  //                 height: 16.h,
                  //                 width: 16.w,
                  //               ),
                  //               6.horizontalSpace,
                  //               Text(
                  //                 '2.5 Km',
                  //                 style: TextStyle(
                  //                   fontSize: 15,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Color(0xFF1A1819),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  21.verticalSpace,
                  Center(
                    child: Image.asset(
                      'asset/images/person.png',
                      height: 186.h,
                      width: 186.w,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "Wilson Fills",
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
                      Text(
                        'PHILADELPHIA',
                        style: TextStyle(
                          color: Color(0xFF1A1819),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  //   height: 66.h,
                  //   width: 133.w,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //     color: Colors.white,
                  //     border: GradientBoxBorder(
                  //       width: 2,
                  //       gradient: LinearGradient(
                  //         colors: [
                  //           Color(0xFF3EBDE5),
                  //           Color(0xFFCFEB65),
                  //         ],
                  //       ),
                  //     ),
                  //   ),

                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       7.horizontalSpace,
                  //       CircularPercentIndicator(
                  //         radius: 25.0,
                  //         lineWidth: 4.0,
                  //         percent: 0.80,
                  //         center: Text(
                  //           '80%',
                  //           style: TextStyle(
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         circularStrokeCap: CircularStrokeCap.round,
                  //         progressColor: Color(0xFF57C05C),
                  //         backgroundColor: Color(0xFFDDE5DC),
                  //         animation: true,
                  //         animationDuration: 2000,
                  //       ),
                  //       SizedBox(width: 8.w),
                  //       Text(
                  //         'Match',
                  //         style: TextStyle(
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
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
                          Text(
                            'About me',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          12.verticalSpace,
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: List.generate(
                              label.length,
                              (index) {
                                return Profilebottombar(label: label[index]);
                              },
                            ),
                          ),
                          32.verticalSpace,
                          Text(
                            'Household',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Profilebottombar(label: 'Parent'),
                          Text(
                            "Hey, I'm Wilson! My partner, Ellen, and I are looking to expand our chosen family. We’re an easygoing couple from Philadelphia. I enjoy staying active – you’ll usually catch me at a game or planning our next adventure. I have a bachelor's degree, and while I do occasionally enjoy a pipe or a cigarette, I’m just as likely to be hanging out with our cats and our little one, or taking care of our reptiles. My partner and I come from diverse backgrounds – I'm Asian, and Ellen is Jewish and Asian with a graduate degree. She loves a good mystery novel and bakes amazing cakes. We’re both pretty moderate when it comes to politics. We’re hoping to find siblings or adult family connections who are looking for a meaningful bond and love being part of a supportive community.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF777777),
                            ),
                          ),
                          32.verticalSpace,
                          Text(
                            "Politics",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Profilebottombar(label: 'Moderate'),
                          32.verticalSpace,
                          Text(
                            "Partner’s Bio",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Profilebottombar(label: '🙏 Judaism'),
                              Profilebottombar(label: '👤 Asian')
                            ],
                          ),
                          Profilebottombar(
                            label: '🎓 Graduate Degree',
                          ),
                          32.verticalSpace,
                          Text(
                            "Partner’s Politics",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Profilebottombar(label: 'Moderate'),
                          32.verticalSpace,
                          Text(
                            "Showcase",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          10.verticalSpace,
                          Container(
                            height: 275.h,
                            width: 327.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFF4FCFF),
                            ),
                            child: Image.asset('asset/images/1uploadphoto.png'),
                          ),
                          10.verticalSpace,
                          Text(
                            "Cheering on our favorite team – game day energy!",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF777777),
                            ),
                          ),
                          32.verticalSpace,
                          Text(
                            "Roles Sought",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Profilebottombar(label: '👤 Sibling'),
                              8.horizontalSpace,
                              Profilebottombar(
                                label: '👤 Adult Child',
                              )
                            ],
                          ),
                          32.verticalSpace,
                          Text(
                            "Involvement",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Profilebottombar(label: '🗣️ Extensive Involvement'),
                          //  Profilebottombar(label: '🗣️ Occasional Gatherings'),
                          32.verticalSpace,
                          Text(
                            "Faith Preferences",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Profilebottombar(label: '🙏 Judaism'),
                              8.horizontalSpace,
                              Profilebottombar(
                                label: '🙏 Catholicism',
                              )
                            ],
                          ),
                          32.verticalSpace,
                          Text(
                            "Race and Ethnicity Preferences",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Profilebottombar(label: '👤 Asian'),
                              8.horizontalSpace,
                              Profilebottombar(
                                label: '👤 Black',
                              ),
                            ],
                          ),
                          32.verticalSpace,
                          Text(
                            "Political Preferences",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Profilebottombar(label: 'Moderate'),
                              8.horizontalSpace,
                              Profilebottombar(
                                label: 'Right-Leaning',
                              )
                            ],
                          ),
                          32.verticalSpace,
                          Text(
                            " Lifestyle Preferences",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Profilebottombar(label: '🚬 No'),
                              8.horizontalSpace,
                              Profilebottombar(
                                label: '🍷 Yes, Regularly',
                              ),
                              8.horizontalSpace,
                              //Profilebottombar(label: '🐾 Cats',)
                            ],
                          ),
                          32.verticalSpace,
                          // Text(
                          //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
                          //   style: TextStyle(
                          //     fontSize: 14.sp,
                          //     fontWeight: FontWeight.w500,
                          //     color: Color(0xFF777777),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         print('hiii');
                            //       },
                            //       child: stackContainer(
                            //         image: Image.asset(
                            //           'asset/images/close-small.png',
                            //           height: 24.h,
                            //           width: 24.w,
                            //         ),
                            //         onTap: () {
                            //           print('jiii');
                            //         },
                            //       ),
                            //     ),
                            //     24.horizontalSpace,
                            //     InkWell(
                            //       onTap: (){
                            //         context.navigateTo(Chatscreen());
                            //       },
                            //       child: stackContainer(
                            //         image: Image.asset(
                            //           'asset/images/messageicon.png',
                            //           height: 26,
                            //           width: 26,
                            //         ),
                            //         onTap: () {},
                            //       ),
                            //     ),
                            //     24.horizontalSpace,
                            //     Container(
                            //       height: 84.h,
                            //       width: 84.w,
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(50),
                            //           color: Color(0xFF005FF2),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Color(0x33005FF2),
                            //               blurRadius: 10,
                            //               spreadRadius: 1,
                            //             ),
                            //           ]),
                            //       child: Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //           horizontal: 24,
                            //         ),
                            //         child: Image.asset(
                            //           'asset/images/like.png',
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
        side: BorderSide(
          color: Color(0xFFDEDEDE),
        ),
      ),
    );
  }
}
