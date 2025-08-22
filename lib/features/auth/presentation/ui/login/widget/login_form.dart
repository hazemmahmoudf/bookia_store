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
  var key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          TextFormField(
            validator: (v){
              if(v==null||v.isEmpty){
                return "Please enter your name";
              }
              return null;
            },
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: AppColor.mainColor,
            decoration: InputDecoration(hintText: "Enter your name"),
          ),
          SizedBox(height: 15.h),
          TextFormField(
            validator: (v){
              RegExp capitalLiter=RegExp(r'(?=.*[A-Z])');
              RegExp smallLitter=RegExp(r'(?=.*[a-z])');
              RegExp number=RegExp(r'(?=.*[0-9])');
              RegExp symbols=RegExp(r'(?=.*[^\w])');
              if(v==null||v.isEmpty){
                return "Please enter your password";
              }else if(!capitalLiter.hasMatch(v)){
                return"Please enter capital letters";
              }else if(!smallLitter.hasMatch(v)){
                return"Please enter small letters";
              }else if(!number.hasMatch(v)){
                return"Please enter the number";
              }else if(!symbols.hasMatch(v)){
                return"Please enter the symbols";
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
          AppButtom(title: "Login", backGroundColor: AppColor.mainColor,
          onPressed: (){
            if(key.currentState?.validate()??false){
              Navigator.push(context, MaterialPageRoute(builder:(context)=> Scaffold()));
            }
          },),
        ],
      ),
    );
  }
}
