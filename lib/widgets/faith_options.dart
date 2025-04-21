import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

final faithOptionProvider = StateProvider<List<String>>((ref) => []);

class FaithOptions extends ConsumerStatefulWidget {
  const FaithOptions({super.key});

  @override
  ConsumerState<FaithOptions> createState() => _FaithOptionsState();
}

class _FaithOptionsState extends ConsumerState<FaithOptions> {
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
    'Prefer Not to Say'
  ];

  @override
  Widget build(BuildContext context) {
    final selectedList = ref.watch(faithOptionProvider);

    log(selectedList.toString());

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: labels.length,
      itemBuilder: (context, index) {
        final isChecked = selectedList.contains(labels[index]);
        final isOtherSelected = selectedList.contains('Other');

        return Column(
          children: [
            CustomCheckBox(
              label: labels[index],
              isChecked: isChecked,
              onChange: (value) {
                final newList = List<String>.from(selectedList);
                if (newList.contains(value)) {
                  newList.remove(value);
                } else {
                  newList.add(value);
                }

                ref.read(faithOptionProvider.notifier).state = newList;
              },
            ),
            if (isOtherSelected && labels[index] == 'Other')
              CustomTextField(
                label: 'Please enter your faith.',
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
              ),
          ],
        );
      },
    );
  }
}

class DevoutnessScale extends StatefulWidget {
  const DevoutnessScale({super.key});

  @override
  State<DevoutnessScale> createState() => _DevoutnessScaleState();
}

class _DevoutnessScaleState extends State<DevoutnessScale> {
  List<String> devoutness = [
    "Not Religious/Not Devout",
    "Somewhat Religious",
    "Moderately Religious",
    "Devout",
    "Very Devout "
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return customrange(label: devoutness[index]);
      },
      physics: NeverScrollableScrollPhysics(),
      itemCount: devoutness.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
    );
  }
}

class RaceandEthnicityOptions extends ConsumerStatefulWidget {
  const RaceandEthnicityOptions({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RaceandEthnicityOptionsState();
}

class _RaceandEthnicityOptionsState
    extends ConsumerState<RaceandEthnicityOptions> {
  List<String> selectedList = [];
  List<String> label = [
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
    //'Other',
    'Prefer Not to Say'
  ];
  @override
  Widget build(BuildContext context) {
    final selectedList = ref.watch(RaceandEthnicityOptionsProvider);
    log(selectedList.toString());
    return ListView.builder(
      itemBuilder: (context, index) {
        final ischecked = selectedList.contains(label[index]);
        //final isOther = selectedList.contains('Other');
        return Column(
          children: [
            CustomCheckBox(
                label: label[index],
                isChecked: ischecked,
                 onChange: (value) {
                final newList = List<String>.from(selectedList);
                if (newList.contains(value)) {
                  newList.remove(value);
                } else {
                  newList.add(value);
                }

                ref.read(RaceandEthnicityOptionsProvider.notifier).state = newList;
              },),
            // if (isOther && label[index] == 'Other')
            //   Padding(
            //     padding: const EdgeInsets.only(
            //       left: 24,
            //       right: 24,
            //     ),
            //     child: CustomTextField(label: 'Enter Faith',  keyboardType: TextInputType.text),
            //   )
          ],
        );
      },
      itemCount: label.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
    );
  }
}
final RaceandEthnicityOptionsProvider = StateProvider<List<String?>>((ref) => []);


final selectedPoliticsProvider = StateProvider<List<String>>((ref) => []);

class PoliticsOption extends ConsumerStatefulWidget {
  const PoliticsOption({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => PoliticsOptionState();
}
class PoliticsOptionState extends ConsumerState<PoliticsOption> {
    List<String> selectedList = [];
  List<String> politics = [
    'Apolitical',
    'Far Left',
    'Left-Leaning',
    'Moderate',
    'Right-Leaning',
    'Far Right',
    'Other',
    'Prefer Not to Say'
  ];
  @override
  Widget build(BuildContext context) {
    final selectedList = ref.watch(selectedPoliticsProvider);
    return ListView.builder(
      itemBuilder: (context, index) {
        final ischecked = selectedList.contains(politics[index]);
        final isOther = selectedList.contains('Other');
        return Column(
          children: [
            CustomCheckBox(
                label: politics[index],
                isChecked: ischecked,
                 onChange: (value) {
                final newList = List<String>.from(selectedList);
                if (newList.contains(value)) {
                  newList.remove(value);
                } else {
                  newList.add(value);
                }

                ref.read(selectedPoliticsProvider.notifier).state = newList;
              },),
            if (isOther && politics[index] == 'Other')
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: CustomTextField(
                    label: 'Please enter your political preference.',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text),
              )
          ],
        );
      },
      itemCount: politics.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
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

class EducationOptions extends ConsumerWidget {
  const EducationOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> educationOptions = [
      'Computer Science',
      'Hotel Management',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Business Administration',
      'Arts & Humanities',
      'Medicine & Health Sciences',
      'Law',
      'Other',
      'Prefer Not to Say'
    ];

    final selectedEducation = ref.watch(educationProvider);

    return DropdownButtonFormField<String>(
      value: selectedEducation,
      hint: Text("Select your Education"),
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      decoration: InputDecoration(fillColor: Colors.white),
      items: educationOptions
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {
        ref.read(educationProvider.notifier).state = value;
      },
    );
  }
}

class PetsOption extends StatefulWidget {
  const PetsOption({super.key});

  @override
  State<PetsOption> createState() => _PetsOptionState();
}

class _PetsOptionState extends State<PetsOption> {
  List<String> selectedList = [];
  List<String> pets = [
    'Dogs',
    'Cats',
    'Rodents',
    'Birds',
    'Fish',
    'Reptiles',
    'None'
  ];
  @override
  Widget build(BuildContext context) {
    log(selectedList.toString());
    return ListView.builder(
      itemBuilder: (context, index) {
        final ischecked = selectedList.contains(pets[index]);
        // final isOther = selectedList.contains('Other');
        return Column(
          children: [
            CustomCheckBox(
                label: pets[index],
                isChecked: ischecked,
                onChange: (value) {
                  setState(() {
                    if (selectedList.contains(value)) {
                      selectedList.remove(value);
                    } else {
                      selectedList.add(value);
                    }
                  });
                }),
            // if (isOther && pets[index] == 'Other')
            //   Padding(
            //     padding: const EdgeInsets.only(
            //       left: 24,
            //       right: 24,
            //     ),
            //     child: CustomTextField(label: 'Enter Faith',  keyboardType: TextInputType.text),
            //   )
          ],
        );
      },
      itemCount: pets.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
    );
  }
}

class LifeStyle extends StatefulWidget {
  const LifeStyle({super.key});

  @override
  State<LifeStyle> createState() => _LifeStyleState();
}

List<String> options = [
  "Yes, Regularly",
  "Occasionally",
  "No",
  "Prefer Not to Say"
];

class _LifeStyleState extends State<LifeStyle> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: 327,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFDFDFDF)),
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
              },
              child: Row(
                children: [
                  Radio<String>(
                    value: options[index],
                    groupValue: currentOption,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentOption = value!;
                      });
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

class smoking extends StatefulWidget {
  const smoking({super.key});

  @override
  State<smoking> createState() => _smokingState();
}

class _smokingState extends State<smoking> {
  List<String> selectedList = [];
  List<String> lifestyle = ["Cigarettes", "Cigars", "Pipe", "Chewing Tobacco"];
  @override
  Widget build(BuildContext context) {
    log(selectedList.toString());
    return ListView.builder(
      itemBuilder: (context, index) {
        final ischecked = selectedList.contains(lifestyle[index]);
        final isCheck = selectedList.contains(lifestyle[index]);
        return Column(
          children: [
            CustomCheckBox(
                label: lifestyle[index],
                isChecked: ischecked,
                onChange: (value) {
                  setState(() {
                    if (selectedList.contains(value)) {
                      selectedList.remove(value);
                    } else {
                      selectedList.add(value);
                    }
                  });
                }),
            if (isCheck && lifestyle[index] == lifestyle[index])
              Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: LifeStyle())
          ],
        );
      },
      itemCount: lifestyle.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
    );
  }
}

class Drinking extends StatefulWidget {
  const Drinking({super.key});

  @override
  State<Drinking> createState() => _DrinkingState();
}

List<String> drinking = [
  "Yes, Regularly",
  "Occasionally",
  "No",
  "Prefer Not to Say"
];

class _DrinkingState extends State<Drinking> {
  String currentOption = drinking[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: drinking.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentOption = drinking[index];
                print(currentOption);
              });
            },
            child: Row(
              children: [
                Radio<String>(
                  value: drinking[index],
                  groupValue: currentOption,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentOption = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(options[index])
              ],
            ),
          );
        });
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
