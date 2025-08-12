import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeLightMode {
  static ThemeData theme=ThemeData(
    fontFamily: "DMSerifDisplay",
    scaffoldBackgroundColor: Colors.white,
    textTheme:lightTextStyle
  );
}
TextTheme lightTextStyle=TextTheme(
  displayLarge: TextStyle(
    fontSize: 30,
  ),
  displaySmall: TextStyle(
    fontSize: 20
  ),titleSmall: TextStyle(
  fontSize: 15
)
);