import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeDarkMode {
 static ThemeData theme=ThemeData(
     fontFamily: "DMSerifDisplay",
  scaffoldBackgroundColor: Colors.black,
   textTheme: darkTextStyle,
   appBarTheme: AppBarTheme(
     backgroundColor: Colors.transparent
   )
 );

}
TextTheme darkTextStyle=TextTheme(
    displayLarge: TextStyle(
      fontSize: 30.sp,

    )
);