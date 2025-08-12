import 'package:bookia/core/theme/app_theme_light_mode.dart';
import 'package:bookia/features/welcome/presentation/ui/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppThemeLightMode.theme,
        debugShowCheckedModeBanner: false,
        home: WelcomScreen(),
      ),
    );
  }
}
