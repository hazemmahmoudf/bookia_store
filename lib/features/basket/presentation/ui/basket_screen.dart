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
                                  ),
                                  SizedBox(height: 9.h),
                                  Text(
                                    "₹${item.itemTotal?.toStringAsFixed(2) ?? '0.00'}",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: 21.h),
                                  Row(
                                    children: [
                                      // زرار الزيادة
                                      GestureDetector(
                                        onTap: () {
                                          context.read<BasketCubit>().updateCart(
                                            cartItemId: item.itemId.toString(),
                                            quantity: currentQty + 1,
                                          );
                                          context.read<BasketCubit>().showCard(false);
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(6.r),
                                          ),
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(currentQty.toString()),
                                      SizedBox(width: 15.w),
                                      // زرار النقصان
                                      GestureDetector(
                                        onTap: () {
                                          if (currentQty > 1) {
                                            context.read<BasketCubit>().updateCart(
                                              cartItemId: item.itemId.toString(),
                                              quantity: currentQty - 1,
                                            );
                                            context.read<BasketCubit>().showCard(false);
                                          }
                                        },
                                        child: Container(
                                          width: 30.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(6.r),
                                          ),
                                          child: const Icon(Icons.remove),
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

          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<BasketCubit, BasketState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 85.h,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total:"),
                    if (state is BasketSuccess)
                      Text("\$ ${state.total ?? 0}"),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                    fixedSize: Size(300.w, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/checkout'),
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
