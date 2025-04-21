import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class FamilyStructureScreen extends ConsumerStatefulWidget {
  const FamilyStructureScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FamilyStructureScreenState();
}

class _FamilyStructureScreenState extends ConsumerState<FamilyStructureScreen> {
  String selectedFamilyType = '';
  List<String> userTypeButtons = [
    'Individual',
    'Couple',
    'Family Unit',
    'Single Parent'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: 'Family Structure',
              text2:
                  'Please select your family structure. You can update this later if your situation changes.'),
          24.verticalSpace,
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFamilyType = userTypeButtons[index];
                  });
                  print(userTypeButtons[index]);
                  ref
                      .read(userTypeProvider.notifier)
                      .update((_) => selectedFamilyType);
                },
                child: familybutton(
                  name: userTypeButtons[index],
                  color: selectedFamilyType == userTypeButtons[index]
                      ? Color(0xFFD7ED5D)
                      : Colors.white,
                  onTap: () {},
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return 16.verticalSpace;
            },
            itemCount: userTypeButtons.length,
            shrinkWrap: true,
          ),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          CoustomText(
              text: 'Household',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
          16.verticalSpace,
          CoustomText(
              text: 'Anyone else share your home?',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          16.verticalSpace,
          Row(
            children: [
              CheckboxCoustmize(),
              CoustomText(
                  text: "Parent(s)",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500))
            ],
          ),
          Row(
            children: [
              CheckboxCoustmize(),
              CoustomText(
                  text: "Sibling(s)",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500))
            ],
          ),
          Row(
            children: [
              CheckboxCoustmize(),
              CoustomText(
                  text: "Roommate(s)",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500))
            ],
          ),
          24.verticalSpace,
          CoustomText(
              text: 'Additional Details',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          TextField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
                  "Tell us more about the people sharing your home if you'd like....",
              hintStyle: TextStyle(
                color: Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
          ),
          24.verticalSpace,
          Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          32.verticalSpace,
          CoustomText(
              text: 'Family Consideration',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
          16.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            height: 179.h,
            //width: 327.w,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color(0xFFFFFFFF),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 239, 237, 237),
                    blurRadius: 14,
                    //  offset: Offset(0, 20),
                    spreadRadius: 4,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please Note:',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF57C05C),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Relative Choice is not a dating site, and the information you provide will not be used to find a romantic partner.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Relative Choice values, respects, and welcomes all types of families.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          CommonText(),
          32.verticalSpace,
          ElevatedButton(
              onPressed: () {
                ref.read(progressBarValueProvider.notifier).state++;
                ref.read(pageControllerProvider.notifier).state.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.bounceIn);
              },
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          32.verticalSpace
        ],
      ),
    );
  }
}

final userTypeProvider = StateProvider<String?>((ref) => null);
