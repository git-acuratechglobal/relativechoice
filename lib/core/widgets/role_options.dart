import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common.dart';
import 'customWidgets.dart';

class RoleOptions extends ConsumerStatefulWidget {
  final void Function(String) onSelectedChanged;

  const RoleOptions({
    super.key,
    required this.onSelectedChanged,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleOptionsState();
}

class _RoleOptionsState extends ConsumerState<RoleOptions> {
  List<String> selectedoptions = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Common().roleoptions.length,
      itemBuilder: (context, index) {
        final role = Common().roleoptions[index];
        final ischecked = selectedoptions.contains(role);
        final isOther = selectedoptions.contains('Adult Child');
        final isOthers = selectedoptions.contains('Grandchild');

        return Column(
          children: [
            CustomCheckBox(
              label: role,
              isChecked: ischecked,
              onChange: (value) {
                setState(() {
                  if (selectedoptions.contains(value)) {
                    selectedoptions.remove(value);
                  } else {
                    selectedoptions.add(value);
                  }
                  widget.onSelectedChanged(
                      selectedoptions.join(",")); // 🔁 Callback here
                });
              },
            ),
            if ((isOther && role == 'Adult Child') ||
                (isOthers && role == 'Grandchild'))
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 1,
                color: Colors.white,
                child: Container(
                  width: 327,
                  height: 116,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Adult children must be 18 years or older to join independently of a family unit. Children under 18 are only matched as part of a family unit.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        );
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}

class DistanceOptions extends StatefulWidget {
  const DistanceOptions({super.key,required this.onSelectionChanged});
  final void Function(String selectedValue) onSelectionChanged;
  @override
  State<DistanceOptions> createState() => _DistanceOptionsState();
}

List<String> distance = [
  "Up to 20 miles",
  "Up to 75 miless",
  "Up to 120 miles",
  "Anywhere in the United States"
];
String currentOption = "";

class _DistanceOptionsState extends State<DistanceOptions> {
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
              });
              widget.onSelectionChanged(currentOption);
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
                    widget.onSelectionChanged(currentOption);
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  distance[index],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        });
  }
}

class Toggle extends ConsumerStatefulWidget {
  const Toggle({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToggleState();
}

class _ToggleState extends ConsumerState<Toggle> {
  bool isSwitched = false;
  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
      print(isSwitched);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isSwitched,
      onChanged: _toggleSwitch,
      activeTrackColor: Colors.green,
    );
  }
}
