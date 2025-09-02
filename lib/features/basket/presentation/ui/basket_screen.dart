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
        centerTitle: true,
        title: Text("MyCard"),
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<BasketCubit, BasketState>(
        builder: (context, state) {
          if(state is BasketLoading){
            return Center(child: CircularProgressIndicator());
          }
        else if(state is BasketSuccess){
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 15.h),
                  child: ListView.separated(
                    itemBuilder: (context, i) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.network(
                              state.cart[i].itemProductImage??"",
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
                                state.cart[i].itemProductName??"",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 9.h),
                              Text(
                                "₹${state.cart[i].itemTotal?.toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(height: 21.h),
                              Row(
                                children: [
                                  Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    child: Icon(Icons.add),
                                  ),
                                  SizedBox(width: 15.h),
                                  Text(state.cart[i].itemQuantity.toString()),
                                  SizedBox(width: 15.h),
                                   Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: Icon(Icons.remove),
                                    ),

                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h, right: 23.w),
                          child: InkWell(
                            onTap: (){
                              context.read<BasketCubit>().removeCard(state.cart[i].itemId??0);
                            },
                            child:state is BasketRemoveLoading
                                ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                                : CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 15,
                              child: Icon(Icons.close, size: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, i) => Divider(),
                    itemCount: state.cart.length,
                  ),
                ),
              ),
            ],
          );
        }
        else {
          return SizedBox();
          }
        }, listener: (BuildContext context, BasketState state) {
          if(state is BasketRemoveSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: AppColor.mainColor,content: Text(state.message)));
            context.read<BasketCubit>().showCard();
          }
      },

      ),
      bottomNavigationBar: BlocBuilder<BasketCubit, BasketState>(
  builder: (context, state) {
    return Container(
        width: double.infinity,
        height: 85.h,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Total:"),
                  if(state is BasketSuccess)
                  Text("\$ ${state.total??0}")],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColor,
                fixedSize: Size(300.w, 40.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                "CheckOut",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
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
