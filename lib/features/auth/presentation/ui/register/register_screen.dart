import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:bookia/features/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia/features/auth/presentation/ui/register/widget/register_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28.h),
                  Text(
                    "Hello! Register to get\nstarted",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 32.h),
                  RegisterForm(),
                  Spacer(),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?   ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "Login Now",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: AppColor.mainColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/login');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 26.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
