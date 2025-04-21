import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';

class BellIcon extends ConsumerStatefulWidget {
  const BellIcon({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BellIconState();
}

class _BellIconState extends ConsumerState<BellIcon> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                }
                ,
                icon: BackIcon()),
             
              Expanded(
                child: Center(
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
          36.verticalSpace,
        Row(
              children: [
                Expanded(
                  child: Divider(color: Color(0xFFE8E6EA), thickness: 1),
                ),
                15.horizontalSpace,
                Text(
                  'Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6C727F),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                15.horizontalSpace,
                Expanded(
                  child: Divider(color: Color(0xFFE8E6EA), thickness: 1),
                ),
              ],
            ),
          28.verticalSpace,
          _notifications('New Match Alert! 🎉', 'You’ve got a new match waiting to connect with you. Start a conversation!', '09:18 PM'),
          _notifications('Unread message Reminder💌 ', 'Don’t leave them hanging! Youhave unread messages from your matches.', '08:49 AM'),
           _notifications('Unread message Reminder💌 ', 'Don’t leave them hanging! Youhave unread messages from your matches.', '08:49 AM'),
            _notifications('Unread message Reminder💌 ', 'Don’t leave them hanging! Youhave unread messages from your matches.', '08:49 AM'),
             _notifications('Unread message Reminder💌 ', 'Don’t leave them hanging! Youhave unread messages from your matches.', '08:49 AM'),  _notifications('Unread message Reminder💌 ', 'Don’t leave them hanging! Youhave unread messages from your matches.', '08:49 AM'), 
              _notifications('Unread message Reminder💌 ', 'Don’t leave them hanging! Youhave unread messages from your matches.', '08:49 AM')
        ],
      ),
    );
  }

  Widget _notifications(String title, String message, String time) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'asset/images/chatperson.png',
              height: 56.h,
              width: 56.h,
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF1A1819),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Color(0xFF1A1819),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      //overflow: TextOverflow.visible
                      
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Color(0xFF6C727F),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        20.verticalSpace,
        Divider(
          color: Color(0xFFE8E6EA),
          thickness: 1.h,
        )
      ],
    );
  }
}
