import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/features/auth/data/cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureText = false;
  var key = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Either the email or password is wrong"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                cursorColor: AppColor.mainColor,
                decoration: InputDecoration(hintText: "Enter your Email"),
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: passwordController,
                validator: (v) {
                  RegExp capitalLiter = RegExp(r'(?=.*[A-Z])');
                  RegExp smallLitter = RegExp(r'(?=.*[a-z])');
                  RegExp number = RegExp(r'(?=.*[0-9])');
                  RegExp symbols = RegExp(r'(?=.*\W)');
                  if (v == null || v.isEmpty) {
                    return "Please enter your password";
                  } else if (!capitalLiter.hasMatch(v)) {
                    return "Please enter capital letters";
                  } else if (!smallLitter.hasMatch(v)) {
                    return "Please enter small letters";
                  } else if (!number.hasMatch(v)) {
                    return "Please enter the number";
                  } else if (!symbols.hasMatch(v)) {
                    return "Please enter the symbols";
                  }
                  return null;
                },
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                obscureText: obscureText,
                cursorColor: AppColor.mainColor,

                decoration: InputDecoration(
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 62.h),
              if(state is LoginLoading)
                LinearProgressIndicator(),
              AppButtom(
                title: "Login",
                backGroundColor: AppColor.mainColor,
                onPressed: () {
                  if (key.currentState?.validate() ?? false) {
                  context.read<CreateAccountCubit>().login(email: emailController.text, password: passwordController.text);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
