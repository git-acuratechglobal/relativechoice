import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/home_feature/widgets/setting.dart';

import 'notification_bottom_sheet.dart';

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
        return const BellIcon();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisSize: MainAxisSize.min,
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
              context.navigateTo(const Setting());
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
