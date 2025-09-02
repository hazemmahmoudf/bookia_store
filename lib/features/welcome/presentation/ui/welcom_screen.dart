import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/features/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/features/auth/presentation/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(AppImages.imagesWelcomeBackGround).image,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 135.h),
            Image.asset(AppImages.imageSplashLogo),
            SizedBox(height: 28.h),
            Text(
              "Order Your Book Now!",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: AppButtom(
                title: 'Login',
                backGroundColor: AppColor.mainColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: AppButtom(
                title: 'Register',
                backGroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ),
            SizedBox(height: 94.h),
          ],
        ),
      ),
    );
  }
}
