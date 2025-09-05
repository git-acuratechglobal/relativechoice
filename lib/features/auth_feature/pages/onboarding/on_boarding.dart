import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import '../../../../core/widgets/relative_tree.dart';
import '../../../../core/widgets/routeanimation.dart';
import '../../auth_state/page_progress_model.dart';
import '../../providers/profile_steps_provider/profile_steps_provider.dart';

class OnBoarding1 extends ConsumerStatefulWidget {
  const OnBoarding1({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends ConsumerState<OnBoarding1> {
  final List<Map<String, dynamic>> onBoardingpage = [
    {
      'color': "0XFFF6FFF4",
      'title': "Here's What Comes Next",
      'subtitle': "You'll tell us about you and your family situation.  ",
    },
    {
      'color': "0XFFF4FCFF",
      'title': "Here's What Comes Next",
      'subtitle':
          "You’ll describe the family members you're hoping to find so we can match you based on what matters most to you.  ",
    },
    {
      'color': "0XFFFFFFFF",
      'title': "Here's What Comes Next",
      'subtitle':
          "You’ll select the roles you'd like to fill— whether grandparent, sibling, or something unique to you.  ",
    }
  ];
  int currentPageIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final currentPage = onBoardingpage[currentPageIndex];
    return Scaffold(
      backgroundColor: Color(int.parse(
        currentPage['color'],
      )),
      body: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: onBoardindPages.length,
            itemBuilder: (BuildContext context, int index) {
              final page = onBoardingpage[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: const BackIcon()),
                  ),
                  //10.verticalSpace,
                  const SizedBox(height: 360.56, child: RelativeTree()),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                          softWrap: true,
                          maxLines: 2,
                          page['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                          )),
                    ),
                  ),
                  10.verticalSpace,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      page['subtitle'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333)),
                    ),
                  ),
                  //  10.verticalSpace,
                  //               Center(
                  //                 child: SizedBox(
                  //                   width: 100,
                  //                   height: 6,
                  //                   child: Row(
                  //                     children: [
                  //                       ListView.separated(
                  //                         physics: NeverScrollableScrollPhysics(),
                  //                         scrollDirection: Axis.horizontal,
                  //                         shrinkWrap: true,
                  //                         itemCount: onBoardindPages.length,
                  //                         itemBuilder: (BuildContext context, int index) {
                  //                           final bool isSelected = currentPageIndex == index;
                  //                           return AnimatedContainer(
                  //                               duration: Duration(microseconds: 500),
                  //                               height: 6.h,
                  //                               width: isSelected ? 26.w : 16.w,
                  //                               decoration: ShapeDecoration(
                  //                                 color: isSelected
                  //                                     ? Color(0xFF005FF2)
                  //                                     : Color(0xFFDEDEDE),
                  //                                 shape: RoundedRectangleBorder(
                  //                                   borderRadius: BorderRadius.circular(20),
                  //                                 ),
                  //                               ));
                  //                         },
                  //                         separatorBuilder: (BuildContext context, int index) {
                  //                           return 5.horizontalSpace;
                  //                         },
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               24.verticalSpace,
                  //                  Align(
                  //    alignment: Alignment.bottomCenter,
                  //    child: Padding(
                  //      padding:  EdgeInsets.symmetric(horizontal: 24),
                  //      child: ElevatedButton(onPressed: (){
                  //         if(currentPageIndex == 2){

                  //             Navigator.push(context, CreateRoute(SignUpSteps()));
                  //          }
                  //          else{
                  //            setState(() {
                  //            currentPageIndex++;
                  //            pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  //          });
                  //          }

                  //      }, child: Text('Next', style: TextStyle(
                  //              fontSize: 20.sp,
                  //              fontWeight: FontWeight.w700,
                  //              color: Colors.white),)),
                  //    ),
                  //  ),
                ],
              );
            },
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
          //  10.verticalSpace,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 110.h),
              child: SizedBox(
                width: 100,
                height: 6,
                child: Row(
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: onBoardindPages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final bool isSelected = currentPageIndex == index;
                        return AnimatedContainer(
                            duration: const Duration(microseconds: 500),
                            height: 6.h,
                            width: isSelected ? 26.w : 16.w,
                            decoration: ShapeDecoration(
                              color: isSelected
                                  ? const Color(0xFF005FF2)
                                  : const Color(0xFFDEDEDE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 5.horizontalSpace;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          //  24.verticalSpace,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: ElevatedButton(
                  onPressed: () {
                    if (currentPageIndex == 2) {
                      final formStep = const FormStepModel(
                        phase: 1,
                        subStep: 0,
                        pageIndex: 0,
                        progressValue: 0,
                      );

                      ref
                          .read(updateProfileStepsProvider.notifier)
                          .updateProfileSteps(steps: formStep.stepAsString);
                      ref
                          .read(localStorageServiceProvider)
                          .setFormStep(formStep: formStep.stepAsString);
                      Navigator.push(context, CreateRoute(const SignUpSteps()));
                    } else {
                      setState(() {
                        currentPageIndex++;
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      });
                    }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> onBoardindPages = [const OnBoarding1(), const OnBoarding1(), const OnBoarding1()];
}
