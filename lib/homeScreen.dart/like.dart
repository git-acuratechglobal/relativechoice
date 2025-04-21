import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/homeScreen.dart/active_feed.dart';
import 'package:relative_choice/homeScreen.dart/bottomsheet_notification.dart';
import 'package:relative_choice/widgets/sugestedContainer.dart';

class Like extends ConsumerStatefulWidget {
  const Like({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikeState();
}

late TabController tabController;
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
  {
    'title': 'Sophie',
    'imagePath': 'asset/images/person.png',
    'subtitle': '5.0 mi away',
    'text': '80% Match'
  },
  {
    'title': 'Sophie',
    'imagePath': 'asset/images/person.png',
    'subtitle': '5.0 mi away',
    'text': '80% Match'
  },
];

class _LikeState extends ConsumerState<Like>
    with SingleTickerProviderStateMixin {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            appbar2(),
            Tabbar(
              tabController: tabController,
              label: 'Liked By Me',
              label2: 'Liked Me',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    24.verticalSpace,
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.72,
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 32        ,
                      ),
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        var suggestion = suggestions[index];
                        return AspectRatio(
                          aspectRatio: 1.0,
                          child: SuggestedContainer(
                            title: suggestion['title']!,
                            imagePath: suggestion['imagePath']!,
                            subtitle: suggestion['subtitle']!,
                            text: suggestion['text']!,
                            widget: Chaticon(),
                          ),
                        );
                      },
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
            title: Align(
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
            actions: [notification()]));
  }
}
