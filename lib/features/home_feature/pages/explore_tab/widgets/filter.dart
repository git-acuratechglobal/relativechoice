import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/features/home_feature/pages/explore_tab/widgets/filterOptions.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import '../../../../../core/widgets/customWidgets.dart';
import '../../../../../core/widgets/faith_options.dart';
import '../../activity_tab/active_feed.dart';


class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
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
    
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(158),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Filters',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: BackIcon(),
                ),
              ),
              10.verticalSpace,
              Tabbar(
                tabController: tabController,
                label: 'Advanced Filters',
                label2: 'Sort by',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [AdvanceFilter(), SortBy()],
        ),
      ),
    );
  }
}

class AdvanceFilter extends ConsumerStatefulWidget {
  const AdvanceFilter({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdvanceFilterState();
}

class _AdvanceFilterState extends ConsumerState<AdvanceFilter> {
  double _currentValue = 10;
  bool istoggle = false;

  String _getReligiousLevel(double value) {
  if (value < 20) {
    return "Not Religious/Not Devout";
  } else if (value < 40) {
    return "Somewhat Religious";
  } else if (value < 60) {
    return "Moderately Religious";
  } else if (value < 80) {
    return "Devout";
  } else {
    return "Very Devout";
  }
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location Range',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          20.verticalSpace,
          Text(
            'Up to ${(_currentValue * 1.9).round()} miles', // Dynamically updates
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            activeColor: Color(0xFF005FF2),
            inactiveColor: Color(0xFFDEDEDE),
            onChanged: (double value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
          Row(
            children: [
              Text(
                'Anywhere in the United States',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: CupertinoSwitch(
                      value: istoggle,
                      onChanged: (value) {
                        setState(() {
                          istoggle = value;
                        });
                      }),
                ),
              ),
            ],
          ),
          24.verticalSpace,
          Divider(
            height: 1,
            color: Color(0xFFDEDEDE),
          ),
          24.verticalSpace,
          Text(
            'Role Preferences',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          RoleOptionsFilter(),
          24.verticalSpace,
          Divider(
            height: 1,
            color: Color(0xFFDEDEDE),
          ),
          24.verticalSpace,
          Text(
            'Pets',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          PetsOption(onChanged: ( selectedPets) {  },),
          24.verticalSpace,
          Divider(
            height: 1,
            color: Color(0xFFDEDEDE),
          ),
          24.verticalSpace,
          Text(
            'Political',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          PoliticsOption(onChanged: (String value) {  },),
          24.verticalSpace,
          Divider(
            height: 1,
            color: Color(0xFFDEDEDE),
          ),
          24.verticalSpace,
          Text(
            'Faith Options',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          FaithOptions(onChanged: (String selectedFaiths) {  },),
          24.verticalSpace,
          Text(
            'Devoutness Scale',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          20.verticalSpace,
       Text(
      _getReligiousLevel(_currentValue), // Dynamically updates text
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    Slider(
      value: _currentValue,
      min: 0,
      max: 100,
      activeColor: Color(0xFF005FF2),
      inactiveColor: Color(0xFFDEDEDE),
      onChanged: (double value) {
        setState(() {
          _currentValue = value;
        });
      },
    ),
          24.verticalSpace,
          Divider(
            height: 1,
            color: Color(0xFFDEDEDE),
          ),
          24.verticalSpace,
          Text(
            'Deal-Breakers',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          customrange(
            label: 'No smokers',
          ),
          customrange(
            label: 'Must like cats',
          ),
          40.verticalSpace,
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 40.w - 40.w) / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(56.h),
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF777777),
                  ),
                  onPressed: () {},
                  child: Text('Reset'),
                ),
              ),
              10.horizontalSpace,
              SizedBox(
                width: (MediaQuery.of(context).size.width - 40.w - 40.w) / 2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Apply'),
                ),
              ),
            ],
          ),
          24.verticalSpace
        ],
      ),
    );
  }
}

class SortBy extends ConsumerStatefulWidget {
  const SortBy({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortByState();
}

class _SortByState extends ConsumerState<SortBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  24.verticalSpace,
            Text(
              'Compatibility Score',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            CompatibilityScore(),
            24.verticalSpace,
            Divider(
              height: 1,
              color: Color(0xFFDEDEDE),
            ),
            24.verticalSpace,
            Text(
              'Distance',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            DistanceScore(),
            24.verticalSpace,
            Divider(
              height: 1,
              color: Color(0xFFDEDEDE),
            ),
            24.verticalSpace,
            Text(
              'Newest Profiles',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            NewestProfiles(),
            30.verticalSpace,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(56.h),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF777777),
                ),
                onPressed: () {},
                child: Text('Reset'),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Apply'),
              ),
            ),
            10.verticalSpace
          ],
        ),
      ),
    );
  }
}

class CompatibilityScore extends StatefulWidget {
  const CompatibilityScore({super.key});

  @override
  State<CompatibilityScore> createState() => _CompatibilityScoreState();
}

List<String> compatibility = [
  "High to Low",
  "Low to High",
];

class _CompatibilityScoreState extends State<CompatibilityScore> {
  String currentOption = compatibility[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: compatibility.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentOption = compatibility[index];
                print(currentOption);
              });
            },
            child: Row(
              children: [
                Radio<String>(
                  value: compatibility[index],
                  groupValue: currentOption,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  compatibility[index],
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        });
  }
}

class DistanceScore extends StatefulWidget {
  const DistanceScore({super.key});

  @override
  State<DistanceScore> createState() => _DistanceScoreState();
}

List<String> distance = [
  "Nearest to Furthest",
  "Furthest to Nearest",
];

class _DistanceScoreState extends State<DistanceScore> {
  String currentOption = distance[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: distance.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentOption = distance[index];
                print(currentOption);
              });
            },
            child: Row(
              children: [
                Radio<String>(
                  value: distance[index],
                  groupValue: currentOption,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  distance[index],
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        });
  }
}

class NewestProfiles extends StatefulWidget {
  const NewestProfiles({super.key});

  @override
  State<NewestProfiles> createState() => _NewestProfilesState();
}

List<String> newestProfile = [
  "Most Recent to Oldest",
  "Oldest to Most Recent ",
];

class _NewestProfilesState extends State<NewestProfiles> {
  String currentOption = newestProfile[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: newestProfile.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentOption = newestProfile[index];
                print(currentOption);
              });
            },
            child: Row(
              children: [
                Radio<String>(
                  value: newestProfile[index],
                  groupValue: currentOption,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  newestProfile[index],
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        });
  }
}
