import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/book_mark/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';

class BestSellerCard extends StatelessWidget {
  final void Function()? onPressed;
  final Products products;
  final void Function()? onTap;
  final void Function()? onTapF;
  final Widget? child;
  const BestSellerCard({
    super.key,
    required this.products,
    this.onPressed,
    this.onTap, this.onTapF, this.child,
  });
  @override
  Widget build(BuildContext context) {
    final originalPrice = double.tryParse(products.price ?? "0") ?? 0;
    final discount = products.discount ?? 0;
    final priceAfterDiscount = originalPrice - (originalPrice * discount / 100);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 165.w,
        height: 300.h,
        child: Column(
          children: [
            InkWell(
                onTap: onTapF,
                child: Image.asset(AppImages.imageHeart,height: 30,width: 30,)),
            Container(

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
                        products.image ?? "",
                        height: 150.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      products.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,style: TextStyle(
                      color: Colors.blue
                    )
                    // Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("₹${priceAfterDiscount.toString()}",style: Theme.of(context).textTheme.titleSmall,),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: Size(60.w, 30.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: onPressed,
                              child: Text("Buy", style: TextStyle(color: Colors.white)),
                            ),

                          ],
                        ),
                      ],


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
