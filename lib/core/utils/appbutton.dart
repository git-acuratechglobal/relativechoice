import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onClick;
  final Size? fixedSize;
  final bool safeArea;
  const PrimaryButton({
    super.key,
    required this.title,
    this.isLoading = false,
    required this.onClick,
    this.fixedSize,
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: fixedSize, disabledBackgroundColor: Color.fromARGB(255, 60, 132, 241)),
      onPressed: switch (isLoading) {
        true => null,
        false => onClick,
      },
      child: switch (isLoading) {
        false => Center(
              child: Text(
            title,
            textAlign: TextAlign.center,
          )),
        true => LoadingAnimationWidget.twistingDots(
            size: 28,
            rightDotColor:Color(0xFF005FF2),
            leftDotColor: Color(0xFFD7ED5D)
          ),
      },
    );
  }
}