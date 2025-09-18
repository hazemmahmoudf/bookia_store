import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeLightMode {
  static ThemeData theme = ThemeData(
    // fontFamily: "DMSerifDisplay",
    scaffoldBackgroundColor: Colors.white,
    textTheme: lightTextStyle,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black, // يخلي العنوان والأيقونات تبان
      elevation: 0,
    ),
    inputDecorationTheme: textFormField,
    iconTheme: const IconThemeData(color: Colors.black), // أيقونات تظهر
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.mainColor,
      brightness: Brightness.light,
    ),
  );
}

TextTheme lightTextStyle = TextTheme(
  displayLarge: TextStyle(fontSize: 30.sp, color: AppColor.colorBlack3),
  displaySmall: TextStyle(fontSize: 20.sp, color: AppColor.colorBlack3),
  titleSmall: TextStyle(fontSize: 15.sp, color: AppColor.colorBlack3),
  titleMedium: TextStyle(fontSize: 24.sp, color: AppColor.colorBlack3),
  bodyMedium: TextStyle(fontSize: 16.sp, color: AppColor.colorBlack3),
  bodyLarge: TextStyle(fontSize: 18.sp, color: AppColor.colorBlack3),
);

InputDecorationTheme textFormField = InputDecorationTheme(
  fillColor: AppColor.lightGrey,
  filled: true,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.borderColor),
  ),
  hintStyle: TextStyle(color: AppColor.hintColor, fontSize: 15.sp),
);
