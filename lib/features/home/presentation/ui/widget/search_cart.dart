import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../data/models/best_seller_model.dart';
class SearchCart extends StatelessWidget {
  final Products products;
  final void Function()? onPressed;
  final void Function()? onTap;
  const SearchCart({super.key, required this.products, this.onPressed, this.onTap});

  @override
  Widget build(BuildContext context) {
    final originalPrice = double.tryParse(products.price ?? "0") ?? 0;
    final discount = products.discount ?? 0;
    final priceAfterDiscount = originalPrice - (originalPrice * discount / 100);
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: 165.w,
        height: 280.h,

        decoration: BoxDecoration(
          color: AppColor.colorCard,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: REdgeInsets.only(
            top: 5.h,
            left: 5.w,
            right: 5.w,
            bottom: 5.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  products.image??""
                  ,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(products.name??"",overflow: TextOverflow.ellipsis,
                maxLines: 1,
              style: Theme.of(context).textTheme.titleSmall,),
              Spacer(),
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [


                  Text("₹ $priceAfterDiscount",style: Theme.of(context).textTheme.titleSmall,),
                  ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(60.w, 30.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),onPressed:onPressed , child: Text("Buy",style: TextStyle(
                      color: Colors.white
                  ),))
                ],
              )
              // SizedBox(height: 23.h,)
            ],
          ),
        ),
      ),
    );
  }
}
