import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/checkout/presentation/ui/widgets/checkout_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              Image.asset(AppImages.imageCheckout,width: 200.w,height: 200.h,),
              CheckoutForm(),
            ],
          ),
        ),
    );
  }
}
