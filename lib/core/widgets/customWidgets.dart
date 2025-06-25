import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/features/auth_feature/pages/sign_up_pages/sign_up_steps.dart';
import 'package:relative_choice/core/widgets/backicon.dart';

import 'linear_progress_bar.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color boxcolor;
  final Color textcolor;
  final Color circularcontainercolor;
  final Image image;
  final VoidCallback onTap;

  const CustomButton(
      {super.key,
      required this.title,
      required this.boxcolor,
      required this.textcolor,
      required this.circularcontainercolor,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // width: 327.w,
        height: 56.h,
        decoration: ShapeDecoration(
          color: boxcolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
              side: BorderSide(width: 0.5, color: Color(0xFFDEDEDE))),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: circularcontainercolor,
                  ),
                  child: image),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: textcolor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final String text2;
  const CustomText({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 28.sp, fontWeight: FontWeight.w800, letterSpacing: -1),
        ),
        Text(text2,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ))
      ],
    );
  }
}

class familybutton extends StatefulWidget {
  // Family buttons
  final String name;
  final Color color;
  final VoidCallback onTap;
  const familybutton(
      {super.key,
      required this.name,
      required this.color,
      required this.onTap});

  @override
  State<familybutton> createState() => _familybuttonState();
}

class _familybuttonState extends State<familybutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 327.w,
        height: 56.h,
        decoration: ShapeDecoration(
          color: widget.color,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFDEDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class CoustomText extends StatelessWidget {
  ///Custom Text
  final String text;
  final TextStyle style;

  const CoustomText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}

class CheckboxCoustmize extends ConsumerStatefulWidget {
  const CheckboxCoustmize({
    super.key,
    required this.label,
    required this.onChanged,
  });
  final String label;
  final ValueChanged<bool> onChanged;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckboxCoustmizeState();
}

class _CheckboxCoustmizeState extends ConsumerState<CheckboxCoustmize> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          side: BorderSide(color: Color(0xFFDEDEDE)),
          activeColor: Color(0xFF57C05C),
          value: ischecked,
          onChanged: (value) {
            setState(() {
              ischecked = value!;
            });
            widget.onChanged(ischecked);
          }),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(dynamic)? onSaved;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  const CustomTextField(
      {super.key,
      required this.label,
      required this.keyboardType,
      required this.controller,
      this.onSaved,
      this.onTap,
      this.readOnly = false,
      this.validator,
      this.onChanged,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorStyle: TextStyle(
          color: Colors.red.shade800,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF777777),
        ),
        hintText: label,
        fillColor: Colors.white,
      ),
      autofocus: false,
      cursorColor: Colors.black,
      controller: controller,
      keyboardType: keyboardType,
      onSaved: onSaved,
      readOnly: readOnly,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: (val) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

class TopBar extends ConsumerStatefulWidget {
  const TopBar({super.key});

  @override
  ConsumerState<TopBar> createState() => _TopBarState();
}

class _TopBarState extends ConsumerState<TopBar> {
  @override
  Widget build(BuildContext context) {
    final curcrentIndex = ref.watch(pageControllerProvider);

    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Row(children: [
        // curcrentIndex.page?.toInt() == 0
        //     ? SizedBox(
        //         height: 40,
        //         width: 20,
        //       )
        //     :
        IconButton(
                onPressed: () {
                  if (curcrentIndex.page?.toInt() == 0) {
                    context.pop();
                    ref.invalidate(progressBarValueProvider);
                  } else {
                    ref
                        .read(pageControllerProvider.notifier)
                        .state
                        .previousPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.bounceIn);
                    ref.read(progressBarValueProvider.notifier).state--;
                  }
                },
                icon: BackIcon()),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 24),
          child: progressBar(),
        ))
      ]),
    );
  }
}

class customrange extends StatefulWidget {
  final String label;
  const customrange({super.key, required this.label});

  @override
  State<customrange> createState() => _customrangeState();
}

class _customrangeState extends State<customrange> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              side: BorderSide(color: Color(0xFFDEDEDE)),
              activeColor: Color(0xFF57C05C),
              value: ischecked,
              onChanged: (value) {
                setState(() {
                  ischecked = value!;
                });
              }),
        ),
        Text(
          widget.label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  final String label;
  final bool isChecked;
  final Function(String) onChange;
  const CustomCheckBox(
      {super.key,
      required this.label,
      required this.isChecked,
      required this.onChange});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool ischecked = false;
  @override
  void initState() {
    ischecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  side: BorderSide(color: Color(0xFFDEDEDE)),
                  activeColor: Color(0xFF57C05C),
                  value: ischecked,
                  onChanged: (value) {
                    setState(() {
                      ischecked = value!;
                      widget.onChange(widget.label);
                    });
                  }),
            ),
          ),
          Text(
            widget.label,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class TopBar2 extends ConsumerStatefulWidget {
  const TopBar2({super.key});

  @override
  ConsumerState<TopBar2> createState() => _TopBar2State();
}

class _TopBar2State extends ConsumerState<TopBar2> {
  @override
  Widget build(BuildContext context) {
    final currentIndex2 = ref.watch(pageControllerProvider2);

    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Row(children: [
        // currentIndex2.page?.toInt() == 0
        //     ? SizedBox(
        //         height: 40,
        //         width: 20,
        //       )
        //     :
        IconButton(
                onPressed: () {
                  if (currentIndex2.page?.toInt() == 0) {
                    context.pop();
                    ref.invalidate(progressBarValueProvider2);
                  } else {
                    ref
                        .read(pageControllerProvider2.notifier)
                        .state
                        .previousPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.bounceIn);
                    ref.read(progressBarValueProvider2.notifier).state--;
                  }
                },
                icon: BackIcon()),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 24),
          child: progressBar2(),
        ))
      ]),
    );
  }
}

class TopBar3 extends ConsumerStatefulWidget {
  const TopBar3({super.key});

  @override
  ConsumerState<TopBar3> createState() => _TopBar3State();
}

class _TopBar3State extends ConsumerState<TopBar3> {
  @override
  Widget build(BuildContext context) {
    final currentIndex3 = ref.watch(pageControllerProvider3);

    return Padding(
      padding: EdgeInsets.only(right: 24, left: 24),
      child: Row(children: [
        // currentIndex3.page?.toInt() == 0
        //     ? SizedBox(
        //         height: 40,
        //         width: 20,
        //       )
        //     :
        IconButton(
                onPressed: () {
                  if (currentIndex3.page?.toInt() == 0) {
                    context.pop();
                    ref.invalidate(progressBarValueProvider3);
                  } else {
                    ref
                        .read(pageControllerProvider3.notifier)
                        .state
                        .previousPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.bounceIn);
                    ref.read(progressBarValueProvider3.notifier).state--;
                  }
                },
                icon: BackIcon()),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 24),
          child: progressBar3(),
        ))
      ]),
    );
  }
}

class CommonText extends StatefulWidget {
  const CommonText({super.key});

  @override
  State<CommonText> createState() => _CommonTextState();
}

class _CommonTextState extends State<CommonText> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'Please note this information will appear on your public profile. Content must be respectful and follow ',
            style: TextStyle(
              color: const Color(0xFF777777),
              fontSize: 12.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Community Guidelines.',
            style: TextStyle(
              color: const Color(0xFF005FF2),
              fontSize: 12.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
