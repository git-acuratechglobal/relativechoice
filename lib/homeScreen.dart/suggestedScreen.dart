import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/homeScreen.dart/active_feed.dart';
import 'package:relative_choice/homeScreen.dart/profile_screen.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/sugestedContainer.dart';

class Suggested extends StatefulWidget {
  const Suggested({super.key, required TabController tabController});

  @override
  
  State<Suggested> createState() => _SuggestedState();
}

class _SuggestedState extends State<Suggested> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                      text: '47',
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
           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 24),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.72,
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    var suggestion = suggestions[index];
                    return InkWell(
                      onTap: () {
                         context.navigateTo(ProfileScreen());
                      },
                      child: SuggestedContainer(
                        title: suggestion['title']!,
                        imagePath: suggestion['imagePath']!,
                        subtitle: suggestion['subtitle']!,
                        text: suggestion['text']!, widget: LikedislikeIcon(),
                      ),
                    );
                  }),
            ),
            24.verticalSpace,
            ActiveContainer()
          ],
        ),
      ),
    );
  }
}
