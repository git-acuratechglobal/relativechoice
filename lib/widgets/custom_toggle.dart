import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:relative_choice/widgets/customWidgets.dart';

class CustomToggle extends StatefulWidget {
  final String name;
  final String? toggletitle;
  final String? optiontitle;
  final List<String> optionsList;
  final List<String> optionsSelectedList;
  final Function(List<String> value) onChanged;
  const CustomToggle({
    super.key,
    this.toggletitle,
    this.optiontitle,
    required this.optionsList,
    required this.optionsSelectedList,
    required this.onChanged,
    required this.name,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool istoggle = false;
  List<String> selectedOptions = [];
  String? otherInput;

  @override
  Widget build(BuildContext context) {
    print(selectedOptions);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoSwitch(
                    value: istoggle,
                    onChanged: (value) {
                      setState(() {
                        istoggle = value;
                      });
                    }),
                SizedBox(width: 10),
                Text(
                  widget.toggletitle ?? 'Open to All',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    height: 1.40,
                  ),
                ),
              ],
            ),
            17.verticalSpace,
            Opacity(
                opacity: istoggle ? 0.5 : 1,
                child: Text(
                  widget.name,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
                )),
            17.verticalSpace,
          ],
        ),
        Opacity(
          opacity: istoggle ? 0.5 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: List.generate(widget.optionsList.length, (index) {
                  final option = widget.optionsList[index];
                  final isSelected = selectedOptions.contains(option);
                  return IgnorePointer(
                    ignoring: istoggle,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              side: BorderSide(color: Color(0xFFDEDEDE)),
                              activeColor: Color(0xFF57C05C),
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  if (isSelected) {
                                    selectedOptions.remove(option);
                                  } else {
                                    selectedOptions.add(option);
                                  }
                                  widget.onChanged(selectedOptions);
                                });
                              }),
                        ),
                        Text(option,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  );
                }),
              ),
              // if (selectedOptions.contains('Other'))
              //   Padding(
              //     padding: const EdgeInsets.only(top: 8.0),
              //     child: CustomTextField(
              //               label: 'Enter Faith',
              //               keyboardType: TextInputType.text,
              //              ),
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomToggle2 extends StatefulWidget {
  const CustomToggle2({super.key});

  @override
  State<CustomToggle2> createState() => _CustomToggle2State();
}

class _CustomToggle2State extends State<CustomToggle2> {
  bool istoggle = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CupertinoSwitch(
                value: istoggle,
                onChanged: (value) {
                  setState(() {
                    istoggle = value;
                  });
                }),
            10.horizontalSpace,
            Text(
              "This is a deal breaker for me",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                height: 1.40,
              ),
            ),
          ],
        ),
        24.verticalSpace,
        if (istoggle == true)
          CoustomText(
              text: 'Additional Details ',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
        8.verticalSpace,
        if (istoggle == true)
          TextField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Any specific details you want to add...",
              hintStyle: TextStyle(
                color: Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
          ),
      ],
    );
  }
}

class lifestyleToggle extends StatefulWidget {
  final String? toggletitle;
  final String optiontitle;
  final List<String> optionsList;
  final List<String> optionsSelectedList;
  final Function(List<String> value) onChanged;

  const lifestyleToggle({
    super.key,
    this.toggletitle,
    required this.optiontitle,
    required this.optionsList,
    required this.optionsSelectedList,
    required this.onChanged,
  });

  @override
  State<lifestyleToggle> createState() => _lifestyleToggleState();
}

class _lifestyleToggleState extends State<lifestyleToggle> {
  bool istoggle = false;
  String? selectedOption; // Single selected option for Radio buttons

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CupertinoSwitch(
              value: istoggle,
              onChanged: (value) {
                setState(() {
                  istoggle = value;
                  if (!istoggle) {
                    selectedOption = null;
                  }
                });
              },
            ),
            10.horizontalSpace,
            Text(
              widget.toggletitle ?? 'Open to All',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Text(
          widget.optiontitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        Column(
          children: [
            Opacity(
              opacity: istoggle ? 0.5 : 1,
              child: IgnorePointer(
                ignoring: istoggle,
                child: Wrap(
                  children: List.generate(widget.optionsList.length, (index) {
                    final option = widget.optionsList[index];
                    return Row(
                      children: [
                        Radio<String>(
                          activeColor: Colors.black,
                          value: option,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                              widget.onChanged([selectedOption!]);
                            });
                          },
                        ),
                        Text(
                          option,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InvolvementToggle extends StatefulWidget {
  const InvolvementToggle({super.key});

  @override
  State<InvolvementToggle> createState() => _InvolvementToggleState();
}

class _InvolvementToggleState extends State<InvolvementToggle> {
  bool istoggle = false;
  List<String> involvement = [
    'Minimal Contact',
    'A Few Times a Year',
    'Occasional Gatherings',
    'Regular Contact',
    'Frequent Involvement',
  ];
  List<String> involvement2 = [
    'Occasional messages, just here for support in emergencies.',
    'Checking in around holidays or birthdays.',
    'Spending some holidays or special occasions together.',
    'Connecting every month or so, sharing life updates.',
    'Seeing each other regularly, building a close connection.',
  ];
  List<String> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CupertinoSwitch(
              value: istoggle,
              onChanged: (value) {
                setState(() {
                  istoggle = value;
                });
              },
            ),
            10.verticalSpace,
            Text(
              'Open to All',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        16.verticalSpace,
        IgnorePointer(
          ignoring: istoggle,
          child: Opacity(
              opacity: istoggle ? 0.5 : 1,
              child: ListView.separated(
                separatorBuilder: (context, index) => 15.verticalSpace,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: involvement.length,
                itemBuilder: (context, index) {
                  final ischecked = selectedList.contains(involvement[index]);
                  return Container(
                    height: 92,
                    decoration: ShapeDecoration(
                      color: ischecked ? const Color(0xFFD7ED5D) : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      checkboxShape: RoundedRectangleBorder(
                        side: ischecked
                            ? BorderSide(width: 1, color: Colors.black)
                            : BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                        borderRadius:
                            BorderRadius.circular(6), 
                      ),
                      value: ischecked,
                      onChanged: (value) {
                        setState(() {
                          if (ischecked) {
                            selectedList.remove(involvement[index]);
                          } else {
                            selectedList.add(involvement[index]);
                          }
                        });
                      },
                      title: Text(
                        involvement[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        involvement2[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}

class CustomToggle3 extends StatefulWidget {
  const CustomToggle3({super.key});

  @override
  State<CustomToggle3> createState() => _CustomToggle3State();
}

class _CustomToggle3State extends State<CustomToggle3> {
  bool istoggle = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CupertinoSwitch(
                value: istoggle,
                onChanged: (value) {
                  setState(() {
                    istoggle = value;
                  });
                }),
            10.horizontalSpace,
            Text(
              "This is a deal breaker for me",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                height: 1.40,
              ),
            ),
          ],
        ),
        24.verticalSpace,
        if (istoggle == true)
          CoustomText(
              text: 'Optional Notes',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
        8.verticalSpace,
        if (istoggle == true)
          TextField(
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
                  'Have specific pet allergies, fears, or preferences? Let us know here! \n(e.g., "Allergic to cats," "Dogs only, no snakes!")',
              hintStyle: TextStyle(
                color: Color(0xFF777777),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Colors.white,
            ),
          ),
      ],
    );
  }
}
