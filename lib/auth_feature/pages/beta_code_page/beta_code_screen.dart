import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/auth_feature/pages/sign_up_pages/sign_up_screen.dart';
import 'package:relative_choice/auth_feature/providers/betacode_provider.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/customWidgets.dart';
import 'package:relative_choice/widgets/relative_image.dart';

class BetaCodeScreen extends ConsumerStatefulWidget {
  const BetaCodeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BetaCodeScreenState();
}

class _BetaCodeScreenState extends ConsumerState<BetaCodeScreen> {
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(betaCodeProvider, (_, next) {
      switch (next) {
        case AsyncData<String?> data when data.value != null:
          Utils.showSnackBar(context, data.value!);
          showWelcomeDialog();
          break;
        case AsyncError error:
          Utils.showSnackBar(context, error.error.toString());
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: BackIcon()),
                  Center(child: topImage()),
                  50.horizontalSpace
                ],
              ),
            ),
            32.verticalSpace,
            CustomText(
                text: "Hello Beta Tester!",
                text2:
                    "Please enter the unique Beta code we  \nsent to your email."),
            32.verticalSpace,
            Text(
              "Beta Code",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            TextField(
              controller: _editingController,
              autofocus: false,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Please enter your beta code.',
                hintStyle: TextStyle(
                  color: Color(0xFF777777),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            24.verticalSpace,
            PrimaryButton(
              isLoading: ref.watch(betaCodeProvider).isLoading,
              title: 'Submit Code',
              onClick: () {
                ref
                    .read(betaCodeProvider.notifier)
                    .sendBetaCode(betaCode: _editingController.text.trim());
              },
            ),
            16.verticalSpace,
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Having trouble? \n',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Contact us',
                      style: TextStyle(
                          color: Color(0xFF005FF2),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: ' for assistance.',
                      style: TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showWelcomeDialog() async {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: WelcomeDialog(),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}

class WelcomeDialog extends StatefulWidget {
  const WelcomeDialog({super.key});

  @override
  State<WelcomeDialog> createState() => _WelcomeDialogState();
}

class _WelcomeDialogState extends State<WelcomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          height: 164,
          width: 1.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFDCF1FD),
                    Color(0xFFEDFEFE),
                    Color(0xFFF5FAE7)
                  ])),
          child: Image.asset(
            'asset/images/grouptree.png',
          ),
        ),
        32.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Welcome to the Founding ',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: 'Family!',
                  style: TextStyle(
                    color: Color(0xFF005FF2),
                    fontSize: 28.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    height: 1.10,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        12.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text(
            'Your input will shape RelativeChoice into the best experience possible. We wish you - and all of us - much success!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        32.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: ElevatedButton(
              onPressed: () {
                context.navigateTo(Sign_Up_Screen());
              },
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              )),
        ),
        24.verticalSpace
      ],
    );
  }
}
