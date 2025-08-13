import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtom extends StatelessWidget {
  final String title;
  final Color backGroundColor;
  final void Function()? onPressed;
  const AppButtom({
    super.key,
    required this.title,
    required this.backGroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 19.h),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: (backGroundColor == AppColor.mainColor)
                ? AppColor.mainColor
                : AppColor.borderColor,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: (backGroundColor == AppColor.mainColor)
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
