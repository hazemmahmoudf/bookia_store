import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.imageTrue, height: 145.h, width: 145.w),
            SizedBox(height:30.h),
            Text("SUCCESS!", style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height:10.h),
            Text(
              "Your order will be delivered soon.\nThank you for choosing our app!",
            style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height:52.h),
            AppButtom(onPressed: (){
              Navigator.pushNamed(context, '/bottom');
            },title: "Back To Home", backGroundColor: AppColor.mainColor)
          ],
        ),
      ),
    );
  }
}
