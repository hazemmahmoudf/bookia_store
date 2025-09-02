import 'dart:developer';

import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/home/presentation/ui/widget/best_seller_card.dart';
import 'package:bookia/features/home/presentation/ui/widget/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().bestSeller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,

        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 13.w),
          child: Image.asset(AppImages.imageAppBar, height: 30.h, width: 99.w),
        ),
        leadingWidth: 100,
        actions: [
          Icon(Icons.search, size: 24.sp),
          SizedBox(width: 13.w),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        buildWhen: (prev, current) =>
            current is HomeSuccess ||
            current is HomeError ||
            current is HomeLoading,
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomeSuccess) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: ImageSlider()),
                // SliverToBoxAdapter(child:  SizedBox(height: 15.h)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 12.h,
                      right: 12.w,
                      left: 12.w,
                      bottom: 2.h,
                    ),
                    child: Text(
                      "Best Seller",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(10.r),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      return BestSellerCard(
                        products: state.product[index],
                        onPressed: () {
                          context.read<HomeCubit>().addToCard(
                            state.product[index].id ?? 0,
                          );
                        },
                      );
                    }, childCount: state.product.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0.h,
                      crossAxisSpacing: 10.0.w,
                      childAspectRatio: 3.w / 4.2.h,
                    ),
                  ),
                ),
              ],
            );
            // return Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     ImageSlider(),
            //     SizedBox(height: 15.h),
            //     Padding(
            //       padding: EdgeInsets.only(left: 16.w),
            //       child: Text(
            //         "Best Seller",
            //         style: Theme.of(context).textTheme.titleMedium,
            //       ),
            //     ),
            //     SizedBox(height: 5.h),
            //
            //     Expanded(
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 16.w),
            //         child: GridView.builder(
            //           itemCount: state.product.length,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             mainAxisSpacing: 10,
            //             crossAxisSpacing: 10,
            //             childAspectRatio: 2.w / 3.h,
            //           ),
            //           itemBuilder: (BuildContext context, int index) {
            //             return BestSellerCard(products: state.product[index]);
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // );
          } else if (state is HomeError) {
            return Image.asset(AppImages.imageNoInternet);
          } else {
            return SizedBox();
          }
        },
        listener: (BuildContext context, HomeState state) {
          if (state is AddToCartSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColor.mainColor,
                content: Text(
                  "add to cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
