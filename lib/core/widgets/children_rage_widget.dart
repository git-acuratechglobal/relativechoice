import 'package:flutter/material.dart';

import 'customWidgets.dart';

class AgeRangeOptions extends StatefulWidget {
  final void Function(String selectedRanges) onChanged;

  const AgeRangeOptions({super.key, required this.onChanged});

  @override
  State<AgeRangeOptions> createState() => _AgeRangeOptionsState();
}

class _AgeRangeOptionsState extends State<AgeRangeOptions> {
  // Displayed labels with mapped internal values
  final Map<String, String> ageRangeMap = {
    'Infant (0-2 years)': 'infant',
    'Young Child (3-7 years)': 'young_child',
    'Older Child (8-12 years)': 'older_child',
    'Teen (13-17 years)': 'teen',
    'Mixed Ages': 'mixed_ages',
  };

  final List<String> _selectedLabels = [];

  void _handleCheck(String label) {
    setState(() {
      if (_selectedLabels.contains(label)) {
        _selectedLabels.remove(label);
      } else {
        _selectedLabels.add(label);
      }
    });

    final selectedValues =
        _selectedLabels.map((e) => ageRangeMap[e]!).join(', ');
    widget.onChanged(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    final labels = ageRangeMap.keys.toList();

    return ListView.builder(
      itemCount: labels.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final label = labels[index];
        final isChecked = _selectedLabels.contains(label);

        return CustomCheckBox(
          key: UniqueKey(),
          label: label,
          isChecked: isChecked,
          onChange: (_) => _handleCheck(label),
        );
      },
    );
  }
}
