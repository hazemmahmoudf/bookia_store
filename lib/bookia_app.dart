import 'package:bookia/core/theme/app_theme_light_mode.dart';
import 'package:bookia/features/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/welcome/presentation/ui/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/cubit/create_account_cubit.dart';
import 'features/auth/presentation/ui/register/register_screen.dart';

class BookiaApp extends StatefulWidget {
  final SharedPreferences prefs;
  const BookiaApp({super.key, required this.prefs});

  @override
  State<BookiaApp> createState() => _BookiaAppState();
}

class _BookiaAppState extends State<BookiaApp> {

  @override

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            theme: AppThemeLightMode.theme,
            debugShowCheckedModeBanner: false,
            initialRoute:(getToken()==null)?'/welcome':'/home',
            routes: {
              '/welcome':(context)=>WelcomScreen(),
              '/register': (context) =>
                  BlocProvider(
                    create: (context) => CreateAccountCubit(),
                    child: const RegisterScreen(),
                  ),
              '/login': (context) =>
                  BlocProvider(
                    create: (context) => CreateAccountCubit(),
                    child: LoginScreen(),
                  ),
            '/home':(context)=>HomeScreen()}
        );
      },
    );
  }
  String? getToken(){

    return widget.prefs.getString('token');
  }
}
