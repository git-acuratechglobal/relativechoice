import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import 'package:relative_choice/features/auth_feature/pages/welcome_screen.dart';

class Setting extends ConsumerStatefulWidget {
  const Setting({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingState();
}

class _SettingState extends ConsumerState<Setting> {
  final List<Map<String, String>> setting = [
    {
      'imagePath': 'asset/images/notification.png',
      'text': 'Notifications',
    },
    {
      'imagePath': 'asset/images/shield-tick.png',
      'text': 'Account Settings',
    },
    {
      'imagePath': 'asset/images/lock.png',
      'text': 'Privacy Preferences',
    },
    {
      'imagePath': 'asset/images/crown.png',
      'text': ' Subscription',
    },
    {
      'imagePath': 'asset/images/info-circle.png',
      'text': 'FAQs',
    },
    {
      'imagePath': 'asset/images/message-question.png',
      'text': 'Help & Support',
    },
    {
      'imagePath': 'asset/images/document-text.png',
      'text': 'Community Guidelines ',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: InkWell(
      //         onTap: () {
      //           context.pop();
      //         },
      //         child: BackIcon()),
      //   ),
      //   title: Center(
      //     child: Text(
      //       'Settings',
      //       style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
      //     ),
      //   ),
      //   centerTitle: true,
      // ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const BackIcon()),
                  70.horizontalSpace,
                  Text(
                    'Settings',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              32.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 5),
                // height: 122.h,
                //width: 327.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFFDCF1FD),
                        Color(0xFFEDFEFF),
                        Color(0xFFF5FAE7),
                      ]),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: const Color(0xFF57C05C)),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/images/subscription.png',
                      height: 44.h,
                      width: 44.w,
                    ),
                    10.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        const Text(
                          'Upgrade Membership Now!',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                        const Text(
                          'Enjoy all the benefits and explore \nmore possibilities.',
                          style: TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              32.verticalSpace,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return settingList(
                    text: setting[index]['text'] ?? '',
                    imagePath: setting[index]['imagePath'] ?? '',
                  );
                },
                itemCount: setting.length,
              ),
              const Divider(
                color: Color(0xFFDEDEDE),
              ),
              ListTile(
                onTap: () async {
                  ref.read(localStorageServiceProvider).clearSession();
                  context.navigateAndRemoveUntil(const WelcomeScreen());
                },
                leading: Image.asset(
                  'asset/images/logout.png',
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: const Color(0xFFFF5A5A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class settingList extends StatefulWidget {
  final String text;
  final String imagePath;
  const settingList({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  State<settingList> createState() => _settingListState();
}

class _settingListState extends State<settingList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        widget.imagePath,
        height: 20.h,
        width: 20.w,
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1A1B28),
        ),
      ),
    );
  }
}
