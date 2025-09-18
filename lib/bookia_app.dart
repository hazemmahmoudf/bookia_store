import 'package:bookia/core/cubit/core_cubit.dart';
import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:bookia/core/theme/app_theme_light_mode.dart';
import 'package:bookia/features/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/features/book_details/presentation/ui/book_details_screen.dart';
import 'package:bookia/features/dash_board/presentation/ui/dash_board_screen.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/welcome/presentation/ui/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme_dark_mode.dart';
import 'features/auth/presentation/cubit/create_account_cubit.dart';
import 'features/auth/presentation/ui/register/register_screen.dart';
import 'features/checkout/presentation/ui/checkout_screen.dart';
import 'features/congrats/presentation/ui/congrats_screen.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return
            BlocBuilder<CoreCubit, CoreState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: state is ChangeMode && state.isDark
                ? AppThemeDarkMode.theme
                    : AppThemeLightMode.theme,

                  debugShowCheckedModeBanner: false,
                  initialRoute: verifyTheToken(),
                  routes: {
                    '/welcome': (context) => WelcomeScreen(),
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
                    '/home': (context) =>
                        HomeScreen(),
                    '/bottom': (context) => DashBoardScreen(),
                    '/checkout': (context) => CheckoutScreen(),
                    '/Congrats': (context) => CongratsScreen(),

                  },
                );
              },
            );
        },
      ),
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
