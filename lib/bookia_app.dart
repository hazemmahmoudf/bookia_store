import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:bookia/core/theme/app_theme_light_mode.dart';
import 'package:bookia/features/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/features/dash_board/presentation/ui/dash_board_screen.dart';

import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/welcome/presentation/ui/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/auth/data/cubit/create_account_cubit.dart';
import 'features/auth/presentation/ui/register/register_screen.dart';
import 'features/home/data/cubit/home_cubit.dart';

class BookiaApp extends StatefulWidget {
  const BookiaApp({super.key});

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
        return
          MultiBlocProvider(
            providers: [
            BlocProvider(create: (context) => HomeCubit()),
        ],child:
          MaterialApp(
          theme: AppThemeLightMode.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: verifyTheToken(),
          routes: {
            '/welcome': (context) => WelcomeScreen(),
            '/register': (context) => BlocProvider(
              create: (context) => CreateAccountCubit(),
              child: const RegisterScreen(),
            ),
            '/login': (context) => BlocProvider(
              create: (context) => CreateAccountCubit(),
              child: LoginScreen(),
            ),
            '/home': (context) => HomeScreen(),
            '/bottom': (context) => DashBoardScreen(),
          },
          ) );
      },
    );
  }

  verifyTheToken() {
    if (SharedPrefsHelper.getString('token') == null) {
      return '/welcome';
    } else {
      return '/bottom';
    }
  }
}
