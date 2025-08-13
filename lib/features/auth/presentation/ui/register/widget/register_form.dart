import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

TextEditingController? controllerPassword = TextEditingController();
var key = GlobalKey<FormState>();
bool obscureTextC = false;
bool obscureTextP = false;

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          TextFormField(
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            cursorColor: AppColor.mainColor,
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.borderColor),
              ),
            ),
          ),
          SizedBox(height: 11.h),
          TextFormField(
            validator: (v) {
              RegExp email = RegExp(r'^[\w]+@([\w]+\.)\w{2,3}$');
              if (v == null || v.isEmpty) {
                return "Please enter your email";
              } else if (!email.hasMatch(v)) {
                return "The email does not match";
              }
              return null;
            },
            cursorColor: AppColor.mainColor,
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.borderColor),
              ),
            ),
          ),
          SizedBox(height: 11.h),
          TextFormField(
            obscureText: obscureTextP,
            controller: controllerPassword,
            validator: (v) {
              RegExp password = RegExp(
                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*~]).{8,}$',
              );
              if (v == null || v.isEmpty) {
                return "Please enter your password";
              } else if (!password.hasMatch(v)) {
                return "The password does not match";
              }
              return null;
            },
            cursorColor: AppColor.mainColor,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextP = !obscureTextP;
                  });
                },
                icon: Icon(
                  (obscureTextP)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.borderColor),
              ),
            ),
          ),
          SizedBox(height: 11.h),
          TextFormField(
            validator: (v) {
              if (v != controllerPassword!.text) {
                return "Does not match the password";
              }
              return null;
            },
            obscureText: obscureTextC,
            cursorColor: AppColor.mainColor,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextC = !obscureTextC;
                  });
                },
                icon: (obscureTextC)
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
              hintText: "Comfirm Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.borderColor),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          AppButtom(
            title: "Register",
            backGroundColor: AppColor.mainColor,
            onPressed: () {
              if (key.currentState?.validate() ?? false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Scaffold()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
