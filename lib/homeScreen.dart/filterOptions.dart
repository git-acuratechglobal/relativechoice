import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/widgets/common.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class RoleOptionsFilter extends ConsumerStatefulWidget {
  const RoleOptionsFilter({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleOptionsFilterState();
}

class _RoleOptionsFilterState extends ConsumerState<RoleOptionsFilter> {
  List<String> selectedoptions = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Common().roleoptions.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final role = Common().roleoptions[index];
        final isChecked = selectedoptions.contains(role);

        return CustomCheckBox(
          label: role,
          isChecked: isChecked,
          onChange: (value) {
            setState(() {
              if (selectedoptions.contains(value)) {
                selectedoptions.remove(value);
              } else {
                selectedoptions.add(value);
              }
            });
          },
        );
      },
    );
  }
}
