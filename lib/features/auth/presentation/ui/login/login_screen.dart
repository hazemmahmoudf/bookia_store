import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:bookia/features/auth/presentation/ui/login/widget/login_form.dart';
import 'package:bookia/features/auth/presentation/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 29.h),
                  Text(
                    "Welcome back! Glad \nto see you, Again!",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 32.h),
                  LoginForm(),
                  SizedBox(height: 34.h),
                  Row(
                    children: [
                      Expanded(child: Divider(endIndent: 14.w)),
                      Text(
                        "Or Login with",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.darkGrey,
                        ),
                      ),
                      Expanded(child: Divider(indent: 14.w)),
                    ],
                  ),
                  SizedBox(height: 21.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 56.h,
                        width: 100.w,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColor.borderColor),
                        ),
                        child: Image.asset(AppImages.iconFaceBook),
                      ),
                      Container(
                        height: 56.h,
                        width: 100.w,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColor.borderColor),
                        ),
                        child: Image.asset(AppImages.iconGoogle),
                      ),

                      Container(
                        height: 56.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColor.borderColor),
                        ),
                        child: Icon(Icons.apple,size: 30,),
                      ),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "Register Now",
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColor.mainColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/register');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
