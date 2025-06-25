import 'package:flutter/material.dart';

class FontVariations extends FontVariation {
  FontVariations._(super.axis, super.value);

  static List<FontVariations> get w600 => [FontVariations._("wght", 600)];
  static List<FontVariations> get w500 => [FontVariations._("wght", 500)];
  static List<FontVariations> get w700 => [FontVariations._("wght", 700)];
  static List<FontVariations> get w800 => [FontVariations._("wght", 800)];
}

extension NavigationPageExtension on BuildContext {
  void navigateTo(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void navigateAndReplace(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void navigateAndRemoveUntil(Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}

extension ImageExtension on num {
  int cacheSize(BuildContext context) {
    return (this * MediaQuery.of(context).devicePixelRatio).round();
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
