import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/features/auth/data/cubit/create_account_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}


class _RegisterFormState extends State<RegisterForm> {
TextEditingController controllerUsername = TextEditingController();
TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPassword = TextEditingController();
TextEditingController controllerConfirmPassword = TextEditingController();

var key = GlobalKey<FormState>();
bool obscureTextC = false;
bool obscureTextP = false;
@override
void dispose() {
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
  listener: (context, state) {
    debugPrint("state of create account ${state.toString()}");
    if(state is CreateAccountSuccess){
     Navigator.pushNamed(context, '/bottom');
    }else if(state is CreateAccountError){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("verify data")));
    }
  }
  ,
  builder: (context, state) {
    return Column(
        children: [
          TextFormField(
            controller: controllerUsername,
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
            controller: controllerEmail,
            validator: (v) {
              RegExp email = RegExp(r'^\w+@(\w+\.)\w{2,3}$');
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
              RegExp capitalLiter = RegExp(
                r'(?=.*[A-Z])',
              );
              RegExp smallLitter=RegExp(r'(?=.*[a-z])');
              RegExp number=RegExp(r'(?=.*[0-9])');
              RegExp symbols=RegExp(r'(?=.*[^A-Za-z0-9])');
              if (v == null || v.isEmpty) {
                return "Please enter your password";
              } else if (!capitalLiter.hasMatch(v)) {
                return "Must contain captain letter";
              }else if (!smallLitter.hasMatch(v)) {
                return "Must contain small letter";
              }else if (!number.hasMatch(v)) {
                return "Must contain number";
              }else if (!symbols.hasMatch(v)) {
                return "Must contain symbols";
              }else if (v.length<6) {
                return "Must contain 6 or more element";
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
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
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
            controller: controllerConfirmPassword,
            validator: (v) {
              if (v != controllerPassword.text) {
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
                    ? Icon(Icons.visibility_outlined)
                    : Icon(Icons.visibility_off_outlined),
              ),
              hintText: "Confirm Password",
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
          if(state is CreateAccountLoading )
            LinearProgressIndicator(),
          AppButtom(
            title: "Register",
            backGroundColor: AppColor.mainColor,
            onPressed: () {
              if (key.currentState?.validate() ?? false) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => Scaffold()),
                // );
                context.read<CreateAccountCubit>().createAccount(name: controllerUsername.text,
                    email: controllerEmail.text,
                    password: controllerPassword.text, confirmPassword: controllerConfirmPassword.text);
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
