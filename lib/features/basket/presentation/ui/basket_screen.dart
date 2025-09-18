import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/basket/presentation/cubit/basket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/bottom'),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text("MyCard"),
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<BasketCubit, BasketState>(
        buildWhen: (prev, current) {
          return current is BasketSuccess || current is BasketError || current is BasketLoading;
        },
        listener: (BuildContext context, BasketState state) {
          if (state is BasketRemoveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 500),
                backgroundColor: AppColor.mainColor,
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BasketLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BasketSuccess) {
            if (state.cart.isEmpty) {
              return const Center(
                child: Text("Your cart is empty"),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: ListView.separated(
                      itemCount: state.cart.length,
                      separatorBuilder: (context, i) => const Divider(),
                      itemBuilder: (context, i) {
                        final item = state.cart[i];
                        final currentQty = item.itemQuantity ?? 0;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.network(
                                item.itemProductImage ?? "",
                                fit: BoxFit.cover,
                                height: 118.h,
                                width: 100.w,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 118.h,
                                      width: 100.w,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.error_outline),
                                    ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.h),
                                  Text(
                                    item.itemProductName ?? "",
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 9.h),
                                  Text(
                                    "₹${item.itemTotal?.toStringAsFixed(2) ?? '0.00'}",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: 21.h),
                                  Row(
                                    children: [
                                      // زرار الزيادة - تم إصلاحه
                                      GestureDetector(
                                        onTap: () {
                                          context.read<BasketCubit>().updateCart(
                                            cartItemId: item.itemId.toString(),
                                            quantity: currentQty + 1,
                                          );
                                          // تم إزالة showCard(false) لأنه يسبب المشاكل
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(6.r),
                                          ),
                                          child: const Icon(Icons.add, size: 18),
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Container(
                                        width: 30.w,
                                        alignment: Alignment.center,
                                        child: Text(
                                          currentQty.toString(),
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      // زرار النقصان - تم إصلاحه
                                      GestureDetector(
                                        onTap: () {
                                          if (currentQty > 1) {
                                            context.read<BasketCubit>().updateCart(
                                              cartItemId: item.itemId.toString(),
                                              quantity: currentQty - 1,
                                            );
                                            // تم إزالة showCard(false) لأنه يسبب المشاكل
                                          }
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(6.r),
                                          ),
                                          child: const Icon(Icons.remove, size: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h, right: 23.w),
                              child: InkWell(
                                onTap: () {
                                  context.read<BasketCubit>().removeCard(item.itemId ?? 0);
                                },
                                child: state is BasketRemoveLoading
                                    ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                                    : CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 15,
                                  child: const Icon(Icons.close, size: 18),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is BasketError) {
            return Center(
              child: Text(
                "Error loading cart",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          return const Center(child: Text("Your cart is empty"));
        },
      ),
      bottomNavigationBar: BlocBuilder<BasketCubit, BasketState>(
        buildWhen: (previous, current) {
          return current is BasketSuccess || current is BasketLoading;
        },
        builder: (context, state) {
          double total = 0;
          int itemCount = 0;

          if (state is BasketSuccess) {
            total = state.total ?? 0;
            itemCount = state.cart.length;
          }

          return Container(
            width: double.infinity,
            height: 85.h,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            decoration: BoxDecoration(

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                    minimumSize: Size(300.w, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: itemCount > 0
                      ? () => Navigator.pushNamed(context, '/checkout')
                      : null,
                  child: Text(
                    "CheckOut",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}