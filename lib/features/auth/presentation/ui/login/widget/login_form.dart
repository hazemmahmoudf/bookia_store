import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: AppColor.mainColor,
            decoration: InputDecoration(hintText: "Enter your name"),
          ),
          SizedBox(height: 15.h),
          TextFormField(
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            obscureText: obscureText,
            cursorColor: AppColor.mainColor,

            decoration: InputDecoration(
              hintText: "Enter your name",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
          ),
          SizedBox(height: 62.h),
          AppButtom(title: "Login", backGroundColor: AppColor.mainColor),
        ],
      ),
    );
  }
}
