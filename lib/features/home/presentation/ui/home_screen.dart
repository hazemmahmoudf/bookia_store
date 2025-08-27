import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/features/home/data/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> image = [AppImages.imageSlider1, AppImages.imageSlider2,AppImages.imageSlider3];

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().productAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        // leading: IconButton(onPressed: ()async{
        // await  SharedPrefsHelper.remove("token");
        // Navigator.pushReplacementNamed(context,'/welcome');
        // }, icon: Icon(Icons.login_outlined)),
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
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state is HomeLoading) Center(child: CircularProgressIndicator()),

              CarouselSlider(
                items: image
                    .map(
                      (item) => Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                    .toList(),
                options: CarouselOptions(
                  height: 150.h,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 30),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.95,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:image.asMap().entries.map(
                      (i) {
                    bool isActive = currentIndex == i.key;
                    return Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 8.h,
                          width: isActive ? 30.w : 8.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: isActive ? AppColor.mainColor : Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(width: 4.w),
                      ],
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 31.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  "Best Seller",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 15.h),
              if (state is HomeSuccess)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GridView.builder(
                      itemCount: state.product.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2 / 3.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final product = state.product[index];
                        return Container(
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
                                    product["image"],
                                    height: 150.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(product["name"],overflow: TextOverflow.ellipsis,
                                  maxLines: 2,),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${product["price"]}\$"),
                                    ElevatedButton(style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      minimumSize: Size(60.w, 30.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),onPressed: (){}, child: Text("Buy",style: TextStyle(
                                        color: Colors.white
                                    ),))
                                  ],
                                )
                                // SizedBox(height: 23.h,)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          );
        },
        listener: (BuildContext context, HomeState state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.messageError)));
          }
        },
      ),
    );
  }
}
