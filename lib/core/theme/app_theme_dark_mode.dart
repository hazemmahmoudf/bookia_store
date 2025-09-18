import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeDarkMode {
  static ThemeData theme = ThemeData(
    // fontFamily: "DMSerifDisplay",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.tealAccent,
    colorScheme: const ColorScheme.dark(
      primary: Colors.tealAccent,
      secondary: Colors.deepOrangeAccent,
      surface: Color(0xFF1E1E1E),
      background: Colors.black,
      error: Colors.redAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: darkTextStyle,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[850],
      hintStyle: TextStyle(color: Colors.grey[500]),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Colors.tealAccent),
      ),
    ),
    // cardTheme: CardTheme(
    //   color: Colors.grey[900],
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(16.r),
    //   ),
    //   elevation: 4,
    //   shadowColor: Colors.black.withOpacity(0.4),
    // ),
    iconTheme: const IconThemeData(color: Colors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.tealAccent,
      foregroundColor: Colors.black,
    ),
  );
}

TextTheme darkTextStyle = TextTheme(
  displayLarge: TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  displaySmall: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  titleMedium: TextStyle(
    fontSize: 16.sp,
    color: Colors.grey[300],
  ),
  titleSmall: TextStyle(
    fontSize: 14.sp,
    color: Colors.grey[400],
  ),
  bodyMedium: TextStyle(
    fontSize: 14.sp,
    color: Colors.grey[200],
  ),
  bodySmall: TextStyle(
    fontSize: 12.sp,
    color: Colors.grey[500],
  ),
);
