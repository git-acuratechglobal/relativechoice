import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/homeScreen.dart/bottom_sheet_screen.dart';
import 'package:relative_choice/homeScreen.dart/setting.dart';
import 'package:relative_choice/navigationextension.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  void _bottomsheeet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * .93)),
      builder: (ctx) {
        return BellIcon();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: _bottomsheeet,
            child: Image.asset(
              'asset/images/notifi.png',
              height: 42,
              width: 42,
            )),
        5.horizontalSpace,
        InkWell(
            onTap: () {
              context.navigateTo(Setting());
            },
            child: Image.asset(
              'asset/images/menu.png',
              height: 42,
              width: 42,
            ))
      ],
    );
  }
}
