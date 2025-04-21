import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/extensions.dart';

class Themes {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
      // scaffoldBackgroundColor: Color(0xFFD7ED5D),
      colorScheme: ColorScheme.light(primary: Colors.white),
      textTheme: _textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border:  OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFDFDF)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFDFDF)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFDFDF)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        filled: true,
        fillColor: Color(0xFFF8F8F8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(56),
        shape: StadiumBorder(),
        backgroundColor: Color(0xFF005FF2),
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          height: 1.50,
        ),
      )),

      textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black, 
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Color(0xFFF6FFF4), 
    dayStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    yearStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    weekdayStyle: TextStyle(
      color: Colors.green.shade700,
      fontWeight: FontWeight.w600,
    ),
    todayForegroundColor: WidgetStateProperty.all( Color(0xFFF6FFF4), ),
    todayBackgroundColor: WidgetStateProperty.all(Colors.green),
  ),
checkboxTheme: CheckboxThemeData(
       fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return Color(0xFF57C05C);
                    }
                return Colors.white;
                  }),
)      
      
      );

  static TextTheme get _textTheme {
    return Typography.englishLike2021.copyWith(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        fontFamily: "Montserrat",
        fontVariations: FontVariations.w800,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontFamily: "Montserrat",
        fontVariations: FontVariations.w800,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 26.0,
        fontVariations: FontVariations.w700,
      ),
      titleLarge: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 20.sp,
        fontVariations: FontVariations.w800,
      ),
      titleMedium: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16.0,
          fontVariations: FontVariations.w500,
          color: Color(0xFF333333)),
      bodyLarge: const TextStyle(
        fontFamily: "Montserrat",
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 14,
          fontVariations: FontVariations.w500,
          color: Color(0xFF777777)),
      bodySmall: const TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12,
      ),
    );
  }
}
