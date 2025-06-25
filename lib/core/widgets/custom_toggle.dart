import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/appsnackbar.dart';
import 'customWidgets.dart';

class CustomToggle extends StatefulWidget {
  final String name;
  final String? toggletitle;
  final String? optiontitle;
  final List<String> optionsList;
  final List<String> optionsSelectedList;
  final Function(String selectedValue) onChanged; // return comma-separated
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
  void initState() {
    super.initState();
    selectedOptions = List.from(widget.optionsSelectedList);
  }

  void _notifyParent() {
    if (istoggle) {
      widget.onChanged("Open to All");
    } else {
      widget.onChanged(selectedOptions.join(", "));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Toggle Switch and Title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CupertinoSwitch(
                  key: UniqueKey(),
                  value: istoggle,
                  onChanged: (value) {
                    setState(() {
                      istoggle = value;
                      if (istoggle) {
                        selectedOptions.clear(); // clear checkboxes
                      }
                      _notifyParent(); // notify on switch
                    });
                  },
                ),
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
            10.verticalSpace,
            Opacity(
              opacity: istoggle ? 0.5 : 1,
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
              ),
            ),
            17.verticalSpace,
          ],
        ),

        /// Options List
        Opacity(
          opacity: istoggle ? 0.5 : 1,
          child: Column(
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
                        key: UniqueKey(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: BorderSide(color: Color(0xFFDEDEDE)),
                        activeColor: Color(0xFF57C05C),
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            istoggle =
                                false; // turn OFF toggle when any option is selected
                            if (isSelected) {
                              selectedOptions.remove(option);
                            } else {
                              selectedOptions.add(option);
                            }
                            _notifyParent(); // callback with updated values
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class CustomToggle2 extends StatefulWidget {
  const CustomToggle2(
      {super.key,
      required this.onChanged,
      required this.onTextChanged,
      this.isOpen = false});

  final Function(int selectedValue) onChanged;
  final Function(String text) onTextChanged;
  final bool? isOpen;
  @override
  State<CustomToggle2> createState() => _CustomToggle2State();
}

class _CustomToggle2State extends State<CustomToggle2> {
  bool istoggle = false;
  TextEditingController _controller = TextEditingController();
  @override
  void didUpdateWidget(covariant CustomToggle2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != null && widget.isOpen! && istoggle) {
      setState(() {
        istoggle = false;
        _controller.clear();
        widget.onChanged(0); // Send 0 to parent
        widget.onTextChanged('');
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CupertinoSwitch(
              key: UniqueKey(),
              value: istoggle,
              onChanged: (value) {
                if (widget.isOpen!=null&&widget.isOpen! && value) {
                  Utils.showSnackBar(context, "Please turn off Open to All and select any one or more option");
                  return;
                }
                setState(() {
                  istoggle = value;
                  widget.onChanged(istoggle ? 1 : 0); // send 1 or 0
                  if (!istoggle) {
                    _controller.clear(); // Clear input if toggled off
                    widget.onTextChanged(''); // Inform parent input cleared
                  }
                });
              },
            ),
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
        if (istoggle)
          CoustomText(
            text: 'Additional Details ',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
        8.verticalSpace,
        if (istoggle)
          TextField(
            controller: _controller,
            onChanged: widget.onTextChanged, // Trigger text callback
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

class LifestyleToggle extends StatefulWidget {
  final String? toggletitle;
  final String optiontitle;
  final List<String> optionsList;
  final String? initialSelectedOption;
  final Function(String value) onChanged;

  const LifestyleToggle({
    super.key,
    this.toggletitle,
    required this.optiontitle,
    required this.optionsList,
    this.initialSelectedOption,
    required this.onChanged,
  });

  @override
  State<LifestyleToggle> createState() => _LifestyleToggleState();
}

class _LifestyleToggleState extends State<LifestyleToggle> {
  bool istoggle = false;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialSelectedOption;
  }

  void _handleToggleChanged(bool value) {
    setState(() {
      istoggle = value;
      if (istoggle) {
        selectedOption = null;
        widget.onChanged('Open to All');
      }
    });
  }

  void _handleOptionSelected(String option) {
    setState(() {
      selectedOption = option;
      istoggle = false; // turn off Open to All toggle
      widget.onChanged(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CupertinoSwitch(
              key: UniqueKey(),
              value: istoggle,
              onChanged: _handleToggleChanged,
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
        // Text(
        //   widget.optiontitle,
        //   style: const TextStyle(
        //     color: Colors.black,
        //     fontSize: 14,
        //     fontWeight: FontWeight.w800,
        //   ),
        // ),
        // 12.verticalSpace,
        Opacity(
          opacity: istoggle ? 0.5 : 1,
          child: IgnorePointer(
            ignoring: istoggle,
            child: Column(
              children: List.generate(widget.optionsList.length, (index) {
                final option = widget.optionsList[index];
                return Row(
                  children: [
                    Radio<String>(
                      value: option,
                      groupValue: selectedOption,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        if (value != null) _handleOptionSelected(value);
                      },
                    ),
                    Text(
                      option,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class InvolvementToggle extends StatefulWidget {
  final void Function(String selectedValue) onSelectionChanged;

  const InvolvementToggle({
    super.key,
    required this.onSelectionChanged,
  });

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

  String get selectedValuesAsCommaSeparated {
    if (istoggle) return 'Open to All';
    return selectedList.join(', ');
  }

  void notifyParent() {
    widget.onSelectionChanged(selectedValuesAsCommaSeparated);
  }

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
                  if (istoggle) {
                    selectedList.clear(); // clear all selections
                  }
                  notifyParent(); // 👈 Callback on switch change
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
                final option = involvement[index];
                final ischecked = selectedList.contains(option);
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
                      borderRadius: BorderRadius.circular(6),
                      side: ischecked
                          ? BorderSide(width: 1, color: Colors.black)
                          : BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                    ),
                    value: ischecked,
                    onChanged: (value) {
                      setState(() {
                        istoggle = false; // turn off Open to All
                        if (ischecked) {
                          selectedList.remove(option);
                        } else {
                          selectedList.add(option);
                        }
                        notifyParent(); // 👈 Callback on checkbox change
                      });
                    },
                    title: Text(
                      option,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
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
            ),
          ),
        ),
        20.verticalSpace,
        // Text(
        //   'Selected: $selectedValuesAsCommaSeparated',
        //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        // )
      ],
    );
  }
}

class CustomToggle3 extends StatefulWidget {
  const CustomToggle3({
    super.key,
    required this.onToggleChanged,
    required this.onNoteChanged,
    this.isOpen = false
  });

  final Function(int) onToggleChanged;
  final Function(String) onNoteChanged;
  final bool? isOpen;
  @override
  State<CustomToggle3> createState() => _CustomToggle3State();
}

class _CustomToggle3State extends State<CustomToggle3> {
  bool istoggle = false;
  TextEditingController noteController = TextEditingController();


  @override
  void didUpdateWidget(covariant CustomToggle3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != null && widget.isOpen! && istoggle) {
      setState(() {
        istoggle = false;
        noteController.clear();
        widget.onToggleChanged(0); // Send 0 to parent
        widget.onNoteChanged('');
      });
    }
  }


  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  void _handleToggle(bool value) {
    if (widget.isOpen!=null&&widget.isOpen! && value) {
      Utils.showSnackBar(context, "Please turn off Open to All and select any one or more option");
      return;
    }
    setState(() {
      istoggle = value;
      widget.onToggleChanged(value ? 1 : 0);
      if (!value) {
        noteController.clear();
        widget.onNoteChanged('');
      }
    });
  }

  void _handleNoteChange(String value) {
    widget.onNoteChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CupertinoSwitch(
              value: istoggle,
              onChanged: _handleToggle,
            ),
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
        if (istoggle) ...[
          CoustomText(
            text: 'Optional Notes',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
          ),
          8.verticalSpace,
          TextField(
            controller: noteController,
            cursorColor: Colors.black,
            maxLength: 150,
            maxLines: 5,
            onChanged: _handleNoteChange,
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
      ],
    );
  }
}
