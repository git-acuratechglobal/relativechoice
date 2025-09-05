import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/widgets/customWidgets.dart';
import 'package:relative_choice/features/auth_feature/params/family_structure_params.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';

class FamilyStructureScreen extends ConsumerStatefulWidget {
  const FamilyStructureScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FamilyStructureScreenState();
}

class _FamilyStructureScreenState extends ConsumerState<FamilyStructureScreen>with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String selectedFamilyType = '';
  List<String> userTypeButtons = [
    'Individual',
    'Couple',
    'Family Unit',
    'Single Parent'
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final familyStructure = ref.read(familyStructureParamsProvider.notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          const CustomText(
              text: 'Family Structure',
              text2:
                  'Please select your family structure. You can update this later if your situation changes.'),
          24.verticalSpace,
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return familybutton(
                name: userTypeButtons[index],
                color: selectedFamilyType == userTypeButtons[index]
                    ? const Color(0xFFD7ED5D)
                    : Colors.white,
                onTap: () {
                  setState(() {
                    selectedFamilyType = userTypeButtons[index];
                  });
                  print(selectedFamilyType);
                  ref.read(localStorageServiceProvider).setUserType(userType: selectedFamilyType);
                  ref
                      .read(userTypeProvider.notifier)
                      .update((_) => selectedFamilyType);
                  familyStructure.update((val) =>
                      val!.copyWith(familyStructure: userTypeButtons[index]));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return 16.verticalSpace;
            },
            itemCount: userTypeButtons.length,
            shrinkWrap: true,
          ),
          24.verticalSpace,
          const Divider(
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
          LivingWithSelector(
            options: const ['Parent(s)', 'Sibling(s)', 'Roommate(s)'],
            onChanged: (selected) {
              familyStructure
                  .update((val) => val!.copyWith(household: selected));
            },
          ),
          24.verticalSpace,
          CoustomText(
              text: 'Additional Details',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          TextFormField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
                  "Tell us more about the people sharing your home if you'd like....",
              hintStyle: TextStyle(
                color: const Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
            onChanged: (val) {
              familyStructure.update(
                  (data) => data!.copyWith(householdAdditionalDetail: val));
            },
            onTapOutside: (val) {
              FocusScope.of(context).unfocus();
            },
          ),
          24.verticalSpace,
          const Divider(
            color: Color(0xFFF7F7F7),
            thickness: 8,
          ),
          32.verticalSpace,
          CoustomText(
              text: 'Family Consideration',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
          16.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            height: 179.h,
            //width: 327.w,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xFFFFFFFF),
                shadows: const [
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
                    color: const Color(0xFF57C05C),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Relative Choice is not a dating site, and the information you provide will not be used to find a romantic partner.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Relative Choice values, respects, and welcomes all types of families.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          const CommonText(),
          32.verticalSpace,
          PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
            title: 'Next',
            onClick: () {
              ref.read(authNotifierProvider.notifier).updateFamilyStructure();
            },
          ),
          32.verticalSpace
        ],
      ),
    );
  }
}

final userTypeProvider = StateProvider<String?>((ref) => null);

class LivingWithSelector extends ConsumerStatefulWidget {
  final List<String> options;
  final ValueChanged<String> onChanged;

  const LivingWithSelector({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  ConsumerState<LivingWithSelector> createState() => _LivingWithSelectorState();
}

class _LivingWithSelectorState extends ConsumerState<LivingWithSelector> {
  final Set<String> _selectedItems = {};

  String _formatLabel(String raw) {
    return raw.toLowerCase().replaceAll('(s)', '').replaceAll(' ', '').trim();
  }

  void _onCheckboxTapped(String label, bool checked) {
    final formatted = _formatLabel(label);

    setState(() {
      if (checked) {
        _selectedItems.add(formatted);
      } else {
        _selectedItems.remove(formatted);
      }
    });

    widget.onChanged(_selectedItems.join(','));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((label) {
        return Row(
          children: [
            CheckboxCoustmize(
              label: label,
              onChanged: (checked) => _onCheckboxTapped(label, checked),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            )
          ],
        );
      }).toList(),
    );
  }
}
