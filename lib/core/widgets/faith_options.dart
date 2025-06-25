

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/widgets/customWidgets.dart';

final faithOptionProvider = StateProvider<List<String>>((ref) => []);

class FaithOptions extends StatefulWidget {
  final void Function(String selectedFaiths) onChanged;

  const FaithOptions({
    super.key,
    required this.onChanged,
  });

  @override
  State<FaithOptions> createState() => _FaithOptionsState();
}

class _FaithOptionsState extends State<FaithOptions> {
  final List<String> labels = [
    'Agnostic',
    'Atheist',
    'Buddhism',
    'Catholicism',
    'Hinduism',
    'Islam',
    'Judaism',
    'Native/Indigenous Spirituality',
    'Protestantism',
    'Spiritual but Not Religious',
    'Other',
    'Prefer Not to Say',
  ];

  final TextEditingController _otherFaithController = TextEditingController();
  final List<String> _selectedList = [];

  @override
  void dispose() {
    _otherFaithController.dispose();
    super.dispose();
  }

  /// Builds the final string to send to API
  String _buildSelectedString() {
    if (_selectedList.contains('Other')) {
      final otherText = _otherFaithController.text.trim();
      return otherText.isNotEmpty ? '$otherText' : 'Other';
    }
    return _selectedList.join(', ');
  }

  void _handleCheck(String value) {
    if (value == 'Other') {
      setState(() {
        _selectedList.clear();
        _selectedList.add('Other');
        _otherFaithController.clear();
        widget.onChanged('Other'); // Will update again on text field input
      });
    } else if (value == 'Prefer Not to Say') {
      setState(() {
        _selectedList.clear();
        _selectedList.add('Prefer Not to Say');
        _otherFaithController.clear();
        widget.onChanged('Prefer Not to Say');
      });
    } else {
      setState(() {
        _selectedList.remove('Other');
        _selectedList.remove('Prefer Not to Say');
        if (_selectedList.contains(value)) {
          _selectedList.remove(value);
        } else {
          _selectedList.add(value);
        }
        widget.onChanged(_buildSelectedString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOtherSelected = _selectedList.contains('Other');

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: labels.length,
      itemBuilder: (context, index) {
        final label = labels[index];
        final isChecked = _selectedList.contains(label);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckBox(
              key: UniqueKey(),
              label: label,
              isChecked: isChecked,
              onChange: (_) => _handleCheck(label),
            ),
            if (label == 'Other' && isOtherSelected)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
                    label: 'Please enter your faith',
                    keyboardType: TextInputType.text,
                    controller: _otherFaithController,
                    onChanged: (_) {
                      widget.onChanged(_buildSelectedString());
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class DevoutnessScale extends StatefulWidget {
  final void Function(String selected) onChanged;

  const DevoutnessScale({super.key, required this.onChanged});

  @override
  State<DevoutnessScale> createState() => _DevoutnessScaleState();
}

class _DevoutnessScaleState extends State<DevoutnessScale> {
  final List<String> devoutness = [
    "Not Religious/Not Devout",
    "Somewhat Religious",
    "Moderately Religious",
    "Devout",
    "Very Devout"
  ];

  final Set<String> _selected = {};

  void _handleCheck(String value, bool isChecked) {
    setState(() {
      if (isChecked) {
        _selected.add(value);
      } else {
        _selected.remove(value);
      }
    });

    // Notify parent with comma-separated string
    widget.onChanged(_selected.join(', '));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: devoutness.length,
      itemBuilder: (context, index) {
        final label = devoutness[index];
        final isChecked = _selected.contains(label);

        return Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                side: const BorderSide(color: Color(0xFFDEDEDE)),
                activeColor: const Color(0xFF57C05C),
                value: isChecked,
                onChanged: (value) {
                  if (value != null) {
                    _handleCheck(label, value);
                  }
                },
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            )
          ],
        );
      },
    );
  }
}

class RaceandEthnicityOptions extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RaceandEthnicityOptions({
    super.key,
    required this.onChanged,
  });

  @override
  State<RaceandEthnicityOptions> createState() =>
      _RaceandEthnicityOptionsState();
}

class _RaceandEthnicityOptionsState extends State<RaceandEthnicityOptions> {
  final List<String> label = [
    'African American',
    'Asian',
    'Black',
    'Caucasian/White',
    'Hispanic/Latino',
    'Indigenous',
    'Middle Eastern',
    'Mixed Race',
    'Native American',
    'Pacific Islander',
    'Prefer Not to Say',
  ];

  final List<String> _selectedList = [];

  void _handleCheck(String value) {
    setState(() {
      if (value == "Prefer Not to Say") {
        // Clear all and only select "Prefer Not to Say"
        _selectedList.clear();
        _selectedList.add(value);
      } else {
        // If selecting any other value, ensure "Prefer Not to Say" is removed
        _selectedList.remove("Prefer Not to Say");

        if (_selectedList.contains(value)) {
          _selectedList.remove(value);
        } else {
          _selectedList.add(value);
        }
      }
    });

    widget.onChanged(_selectedList.join(', '));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: label.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final isChecked = _selectedList.contains(label[index]);

        return CustomCheckBox(
          key: UniqueKey(),
          label: label[index],
          isChecked: isChecked,
          onChange: (_) => _handleCheck(label[index]),
        );
      },
    );
  }
}

final RaceandEthnicityOptionsProvider =
    StateProvider<List<String?>>((ref) => []);

final selectedPoliticsProvider = StateProvider<List<String>>((ref) => []);

class PoliticsOption extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PoliticsOption({super.key, required this.onChanged});

  @override
  State<PoliticsOption> createState() => _PoliticsOptionState();
}

class _PoliticsOptionState extends State<PoliticsOption> {
  final List<String> politics = [
    'Apolitical',
    'Far Left',
    'Left-Leaning',
    'Moderate',
    'Right-Leaning',
    'Far Right',
    'Other',
    'Prefer Not to Say',
  ];

  final List<String> selectedList = [];
  final TextEditingController _otherController = TextEditingController();

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  // void _handleCheck(String value) {
  //   setState(() {
  //     if (value == 'Other') {
  //       selectedList.clear();
  //       selectedList.add('Other');
  //       _otherController.clear();
  //     } else {
  //       selectedList.remove('Other');
  //       if (selectedList.contains(value)) {
  //         selectedList.remove(value);
  //       } else {
  //         selectedList.add(value);
  //       }
  //     }
  //   });
  //
  //   widget.onChanged(_buildSelectedString());
  // }

  void _handleCheck(String value) {
    if (value == 'Other') {
      setState(() {
        selectedList.clear();
        selectedList.add('Other');
        _otherController.clear();
        widget.onChanged('Other'); // Will update again on text field input
      });
    } else if (value == 'Prefer Not to Say') {
      setState(() {
        selectedList.clear();
        selectedList.add('Prefer Not to Say');
        _otherController.clear();
        widget.onChanged('Prefer Not to Say');
      });
    } else {
      setState(() {
        selectedList.remove('Other');
        selectedList.remove('Prefer Not to Say');
        if (selectedList.contains(value)) {
          selectedList.remove(value);
        } else {
          selectedList.add(value);
        }
        widget.onChanged(_buildSelectedString());
      });
    }
  }

  String _buildSelectedString() {
    if (selectedList.contains('Other')) {
      final otherText = _otherController.text.trim();
      return otherText.isNotEmpty ? otherText : 'Other';
    }
    return selectedList.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final isOther = selectedList.contains('Other');

    return ListView.builder(
      itemCount: politics.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final label = politics[index];
        final isChecked = selectedList.contains(label);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckBox(
              key: UniqueKey(),
              label: label,
              isChecked: isChecked,
              onChange: (_) => _handleCheck(label),
            ),
            if (label == 'Other' && isOther)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: CustomTextField(
                  label: 'Please enter your political preference.',
                  controller: _otherController,
                  keyboardType: TextInputType.text,
                  onChanged: (_) {
                    widget.onChanged(_buildSelectedString());
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

// class PoliticsOption extends StatefulWidget {
//   const PoliticsOption({super.key});

//   @override
//   State<PoliticsOption> createState() => _PoliticsOptionState();
// }

// class _PoliticsOptionState extends State<PoliticsOption> {
//   List<String> selectedList = [];
//   List<String> politics = [
//     'Apolitical',
//     'Far Left',
//     'Left-Leaning',
//     'Moderate',
//     'Right-Leaning',
//     'Far Right',
//     'Other',
//     'Prefer Not to Say'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         final ischecked = selectedList.contains(politics[index]);
//         final isOther = selectedList.contains('Other');
//         return Column(
//           children: [
//             CustomCheckBox(
//                 label: politics[index],
//                 isChecked: ischecked,
//                 onChange: (value) {
//                   setState(() {
//                     if (selectedList.contains(value)) {
//                       selectedList.remove(value);
//                     } else {
//                       selectedList.add(value);
//                     }
//                   });
//                 }),
//             if (isOther && politics[index] == 'Other')
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 24,
//                   right: 24,
//                 ),
//                 child: CustomTextField(
//                     label: 'Please enter your political preference.',
//                     keyboardType: TextInputType.text),
//               )
//           ],
//         );
//       },
//       itemCount: politics.length,
//       physics: NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//     );
//   }
// }

final educationProvider = StateProvider<String?>((ref) => null);

class EducationOptions extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const EducationOptions(
      {super.key,
      required this.value,
      required this.onChanged,
      this.validator});

  static const List<String> educationOptions = [
    'Computer Science',
    'Hotel Management',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Business Administration',
    'Arts & Humanities',
    'Medicine & Health Sciences',
    'Law',
    'Other',
    'Prefer Not to Say',
  ];

  @override
  Widget build(BuildContext context) {
    final isValidValue = value == null || educationOptions.contains(value);

    return DropdownButtonFormField<String>(
      validator: validator,
      value: isValidValue ? value : null,
      hint: const Text("Select your Education"),
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      decoration: const InputDecoration(fillColor: Colors.white),
      items: educationOptions
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}

class PetsOption extends StatefulWidget {
  final void Function(String selectedPets) onChanged;

  const PetsOption({super.key, required this.onChanged});

  @override
  State<PetsOption> createState() => _PetsOptionState();
}

class _PetsOptionState extends State<PetsOption> {
  List<String> selectedList = [];

  final List<String> pets = [
    'Dogs',
    'Cats',
    'Rodents',
    'Birds',
    'Fish',
    'Reptiles',
    'None'
  ];

  void _handleCheck(String value) {
    setState(() {
      if (value == 'None') {
        selectedList = ['None'];
      } else {
        selectedList.remove('None');
        if (selectedList.contains(value)) {
          selectedList.remove(value);
        } else {
          selectedList.add(value);
        }
      }

      widget
          .onChanged(selectedList.join(",")); // Send selected values to parent
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pets.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final label = pets[index];
        final isChecked = selectedList.contains(label);

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

class LifeStyleSelector extends StatefulWidget {
  final String initial;
  final void Function(String value) onChanged;

  const LifeStyleSelector({
    super.key,
    required this.initial,
    required this.onChanged,
  });

  @override
  State<LifeStyleSelector> createState() => _LifeStyleSelectorState();
}

class _LifeStyleSelectorState extends State<LifeStyleSelector> {
  late String currentOption;

  // Define the lifestyle options here
  final List<String> options = [
    "Yes, Regularly",
    "Occasionally",
    "No",
    "Prefer Not to Say"
  ];

  @override
  void initState() {
    super.initState();
    currentOption = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: 327,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDFDFDF)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 40,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentOption = options[index];
                });
                widget.onChanged(currentOption);
              },
              child: Row(
                children: [
                  Radio<String>(
                    value: options[index],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                      widget.onChanged(currentOption);
                    },
                    activeColor: Colors.black,
                  ),
                  Text(options[index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LifeStyleSelector2 extends StatefulWidget {
  final String initial;
  final void Function(String value) onChanged;

  const LifeStyleSelector2({
    super.key,
    required this.initial,
    required this.onChanged,
  });

  @override
  State<LifeStyleSelector2> createState() => _LifeStyleSelector2State();
}

class _LifeStyleSelector2State extends State<LifeStyleSelector2> {
  late String currentOption;

  // Define the lifestyle options here
  final List<String> options = [
    "Yes, Regularly",
    "Occasionally",
    "No",
    "Prefer Not to Say"
  ];

  @override
  void initState() {
    super.initState();
    currentOption = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: 327,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDFDFDF)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 40,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentOption = options[index];
                });
                widget.onChanged(currentOption);
              },
              child: Row(
                children: [
                  Radio<String>(
                    key: UniqueKey(),
                    value: options[index],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                      widget.onChanged(currentOption);
                    },
                    activeColor: Colors.black,
                  ),
                  Text(options[index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Smoking extends StatefulWidget {
  final void Function(Map<String, String> selectedValues) onChanged;
  final bool? isLifeStylePage;
  final String? toggleTitle;

  const Smoking({
    super.key,
    required this.onChanged,
    this.isLifeStylePage = false,
    this.toggleTitle,
  });

  @override
  State<Smoking> createState() => _SmokingState();
}

class _SmokingState extends State<Smoking> {
  final List<String> lifestyle = [
    "Cigarettes",
    "Cigars",
    "Pipe",
    "Chewing Tobacco"
  ];
  final Map<String, String> selectedLifestyleMap = {}; // shown in UI only
  Map<String, String> selectedLifestyleMap1 = {}; // used for API
  bool isOpenToAll = false;

  void updateLifestyle(String smokingType, String frequency) {
    setState(() {
      // If user selects any option, turn off "Open to All"
      if (isOpenToAll) {
        isOpenToAll = false;
      }

      selectedLifestyleMap[smokingType] = frequency;
    });
    prepareAndSendData();
  }

  void handleToggle(String smokingType) {
    setState(() {
      // If user selects any option, turn off "Open to All"
      if (isOpenToAll) {
        isOpenToAll = false;
      }

      if (selectedLifestyleMap.containsKey(smokingType)) {
        selectedLifestyleMap.remove(smokingType);
      } else {
        selectedLifestyleMap[smokingType] = "No";
      }
    });
    prepareAndSendData();
  }

  void handleToggleChanged(bool value) {
    setState(() {
      isOpenToAll = value;

      // If "Open to All" is selected, clear all other selections
      if (isOpenToAll) {
        selectedLifestyleMap.clear();
        widget.onChanged({'Open to All': 'Yes'});
      } else {
        prepareAndSendData();
      }
    });
  }

  void prepareAndSendData() {
    if (isOpenToAll) {
      widget.onChanged({'Open to All': 'Yes'});
      return;
    }

    // Copy selected items first
    selectedLifestyleMap1 = Map.from(selectedLifestyleMap);

    // Add the remaining ones as "No" (only for API)
    for (var type in lifestyle) {
      selectedLifestyleMap1.putIfAbsent(type, () => "No");
    }

    // Send to API
    widget.onChanged(Map.from(selectedLifestyleMap1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isLifeStylePage != null && widget.isLifeStylePage!)
          Row(
            children: [
              CupertinoSwitch(
                key: UniqueKey(),
                value: isOpenToAll,
                onChanged: handleToggleChanged,
              ),
              10.horizontalSpace,
              Text(
                widget.toggleTitle ?? 'Open to All',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        Opacity(
          opacity: isOpenToAll ? 0.5 : 1,
          child: IgnorePointer(
            ignoring: isOpenToAll,
            child: ListView.builder(
              itemCount: lifestyle.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final label = lifestyle[index];
                final isChecked = selectedLifestyleMap.containsKey(label);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCheckBox(
                      key: UniqueKey(),
                      label: label,
                      isChecked: isChecked,
                      onChange: (_) => handleToggle(label),
                    ),
                    if (isChecked)
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: LifeStyleSelector(
                          key: UniqueKey(),
                          initial: selectedLifestyleMap[label]!,
                          onChanged: (value) => updateLifestyle(label, value),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Smoking2 extends StatefulWidget {
  final void Function(dynamic selectedValues) onChanged;
  final bool? isLifeStylePage;
  final String? toggleTitle;

  const Smoking2({
    super.key,
    required this.onChanged,
    this.isLifeStylePage = false,
    this.toggleTitle,
  });

  @override
  State<Smoking2> createState() => _Smoking2State();
}

class _Smoking2State extends State<Smoking2> {
  // Initial selection for the main smoking status
  String? selectedOption;

  // Map to track which lifestyle options are selected and their values
  final Map<String, String> lifestyleSelections = {};

  // List of lifestyle options
  final List<String> lifestyleOptions = [
    "Cigarettes",
    "Cigars",
    "Pipe",
    "Chewing Tobacco"
  ];

  // For "Open to All" toggle
  bool isOpenToAll = false;

  @override
  void initState() {
    super.initState();
    // Initialize default values
    for (var option in lifestyleOptions) {
      lifestyleSelections[option] = "No";
    }
  }

  // Handle main smoking status selection
  void handleMainSelection(String value) {
    setState(() {
      // If "Open to All" is enabled, disable it
      if (isOpenToAll) {
        isOpenToAll = false;
      }

      selectedOption = value;

      // If user selects "No" or "Prefer Not to Say", reset all lifestyle options to "No"
      if (value == "No" || value == "Prefer Not to Say") {
        for (var option in lifestyleOptions) {
          lifestyleSelections[option] = "No";
        }
      }
    });

    prepareAndSendData();
  }

  // Handle lifestyle option selection
  void handleLifestyleSelection(String lifestyle, String value) {
    setState(() {
      lifestyleSelections[lifestyle] = value;
    });

    prepareAndSendData();
  }

  // Handle "Open to All" toggle
  void handleToggleChanged(bool value) {
    setState(() {
      isOpenToAll = value;

      if (isOpenToAll) {
        // Clear main selection and all lifestyle selections
        selectedOption = null;
        for (var option in lifestyleOptions) {
          lifestyleSelections[option] = "No";
        }
        // Send just the string "Open to All" as specified
        widget.onChanged("Open to All");
      } else {
        prepareAndSendData();
      }
    });
  }

  // Prepare data for API and send through callback
  void prepareAndSendData() {
    if (isOpenToAll) {
      widget.onChanged("Open to All");
      return;
    }

    if (selectedOption == null) return;
    if (selectedOption == "Prefer Not to Say") {
      widget.onChanged("Prefer Not to Say");
      return;
    }

    Map<String, String> dataForAPI = {};

    for (var option in lifestyleOptions) {
      if (lifestyleSelections[option] != "No") {
        dataForAPI[option] = selectedOption!;
      } else {
        dataForAPI[option] = "No";
      }
    }

    widget.onChanged(dataForAPI);
  }

  @override
  Widget build(BuildContext context) {
    // Main lifestyle options
    final List<String> mainOptions = [
      "Yes, Regularly",
      "Occasionally",
      "No",
      "Prefer Not to Say"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Open to All" toggle if on lifestyle page
        if (widget.isLifeStylePage != null && widget.isLifeStylePage!)
          Row(
            children: [
              CupertinoSwitch(
                key: UniqueKey(),
                value: isOpenToAll,
                onChanged: handleToggleChanged,
              ),
              10.horizontalSpace,
              Text(
                widget.toggleTitle ?? 'Open to All',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

        // Main section - disabled when "Open to All" is selected
        Opacity(
          opacity: isOpenToAll ? 0.5 : 1,
          child: IgnorePointer(
            ignoring: isOpenToAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: mainOptions.length,
                  itemBuilder: (context, index) {
                    final currentOption = mainOptions[index];
                    final isSelected = selectedOption == currentOption;
                    final shouldShowOptions = isSelected &&
                        (currentOption == "Yes, Regularly" || currentOption == "Occasionally");

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main option radio button
                        InkWell(
                          onTap: () => handleMainSelection(currentOption),
                          child: Row(
                            children: [
                              Radio<String>(
                                key: UniqueKey(),
                                value: currentOption,
                                groupValue: selectedOption,
                                onChanged: (value) => handleMainSelection(value!),
                                activeColor: Colors.black,
                              ),
                              Text(currentOption)
                            ],
                          ),
                        ),

                        // Show lifestyle options only under the selected "Yes" or "Occasionally" option
                        if (shouldShowOptions)
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: lifestyleOptions.map((option) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomCheckBox(
                                      key: UniqueKey(),
                                      label: option,
                                      isChecked: lifestyleSelections[option] != "No",
                                      onChange: (_) {
                                        setState(() {
                                          if (lifestyleSelections[option] == "No") {
                                            lifestyleSelections[option] = "Yes";
                                          } else {
                                            lifestyleSelections[option] = "No";
                                          }
                                          prepareAndSendData();
                                        });
                                      },
                                    ),

                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Drinking extends StatefulWidget {
  final void Function(String) onChanged;

  const Drinking({super.key, required this.onChanged});

  @override
  State<Drinking> createState() => _DrinkingState();
}

class _DrinkingState extends State<Drinking> {
  final List<String> drinking = [
    "Yes, Regularly",
    "Occasionally",
    "No",
    "Prefer Not to Say"
  ];

  String currentOption = "";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: drinking.length,
      itemBuilder: (context, index) {
        final option = drinking[index];
        return InkWell(
          onTap: () {
            setState(() {
              currentOption = option;
              widget.onChanged(currentOption); // Return value to parent
            });
          },
          child: Row(
            children: [
              Radio<String>(
                value: option,
                groupValue: currentOption,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      currentOption = value;
                      widget.onChanged(currentOption); // Return value to parent
                    });
                  }
                },
                activeColor: Colors.black,
              ),
              Text(option),
            ],
          ),
        );
      },
    );
  }
}

// class CustomHousehold extends StatefulWidget {
//   const CustomHousehold({super.key});

//   @override
//   State<CustomHousehold> createState() => _CustomHouseholdState();
// }

// class _CustomHouseholdState extends State<CustomHousehold> {
//   List<String> household = ['Parents(s)', 'Silbling(s)', 'Roommate(s)'];
//   List<String> selectedList = [];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (context, index) {
//     final ischecked = selectedList.contains(household[index]);
//     return Column(
//       children: [
//         CustomCheckBox(
//             label: household[index],
//             isChecked: ischecked, onChange: (value ) {
//                   setState(() {
//                     if(selectedList.contains(value)){
//                       if(selectedList.remove(value));
//                     }else{
//                       selectedList.add(value);
//                     }
//                   });
//               },
//     ),

//     ],

//         );

//     },
//     itemCount: household.length,
//     shrinkWrap: true,
//        physics: NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//     );
//   }
// }
