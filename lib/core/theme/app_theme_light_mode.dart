import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeLightMode {
  static ThemeData theme=ThemeData(
    fontFamily: "DMSerifDisplay",
    scaffoldBackgroundColor: Colors.white,
    textTheme:lightTextStyle,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent
      ),
    inputDecorationTheme: textFormField,
  );
}
TextTheme lightTextStyle=TextTheme(
  displayLarge: TextStyle(
    fontSize: 30.sp,
  ),
  displaySmall: TextStyle(
    fontSize: 20.sp
  ),titleSmall: TextStyle(
  fontSize: 15.sp
),

);
InputDecorationTheme textFormField=InputDecorationTheme(
  fillColor: AppColor.lightGrey,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),

  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.borderColor
    )
  ),
  hintStyle: TextStyle(
color:AppColor.hintColor,
    fontSize: 15.sp
  )
);