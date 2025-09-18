import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/book_mark/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/cubit/home_cubit.dart';
import '../../../data/models/wishlist_model.dart';

class CartWishlist extends StatelessWidget {
  final WishlistItem wishlistItem;
 final void Function()? onPressed;
   final Function()? onTap;
  const CartWishlist({super.key, required this.wishlistItem, this.onPressed, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child:Image.network(
              wishlistItem.image ?? "",
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            )
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wishlistItem.name ?? "No title",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10.h,
                  ),
                Text("\$${wishlistItem.price ?? 0}",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainColor,
                      minimumSize: Size(double.infinity, 35.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed:onPressed,
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
              onTap:onTap,
              child: Icon(Icons.delete,color: Colors.red,))       ],
      ),
    );
  }
}
