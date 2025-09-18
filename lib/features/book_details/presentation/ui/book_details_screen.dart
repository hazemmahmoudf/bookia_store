import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key,required this.products, this.onPressed});
 final Products products;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final String cleanText = (products.description??"").replaceAll(RegExp(r'<[^>]*>'), '');
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation:0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          Icon(Icons.book),
          SizedBox(width: 20.w),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30.h,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    fit: BoxFit.cover,
                   products.image??"",
                    height: 272.h,
                    width: 183.w,
                  ),
                ),
                SizedBox(height: 11.h,),
                Text(products.name??""),
                SizedBox(height: 16.h,),

                Text(
                    cleanText           ),



              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text("₹ ${products.price}"),
              Spacer(),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                  fixedSize:Size(212, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),

                  )
              ),onPressed:onPressed , child: Text("Add To Cart",
                style: TextStyle(
                    color: Colors.white
                ),))
            ],
          ),
        ),
      ),
    );
  }
}
