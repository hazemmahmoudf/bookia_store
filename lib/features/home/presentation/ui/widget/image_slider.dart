import 'package:bookia/core/theme/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../cubit/home_cubit.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().imageSlider();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev,current)=>current is SliderSuccess||current is SliderLoading||current is SliderError,
  builder: (context, state) {
    if(state is SliderLoading){
      return LinearProgressIndicator();
    }
   else if(state is SliderSuccess){
      return Column(
        children: [
          CarouselSlider(
            items: state.images
                .map(
                  (item) => Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: NetworkImage(item.image??""),
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
              aspectRatio: 15 / 9,
              viewportFraction: 0.95,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: state.images.length,
            effect: ExpandingDotsEffect(
                radius: 10.r,
                dotHeight: 10.h,
                dotWidth: 10.w,
                expansionFactor: 5,
                activeDotColor: AppColor.mainColor
            ),
          )
        ],
      );
    }
  else{
    return SizedBox();
  }
  },
);
  }
}
