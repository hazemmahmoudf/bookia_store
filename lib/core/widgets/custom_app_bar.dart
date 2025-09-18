import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation:0,
      backgroundColor: Colors.transparent,
      leadingWidth: 70.w,
      leading: Container(
        margin: EdgeInsetsDirectional.only(start: 24.w),
        width: 41.w,
        height: 41.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColor.borderColor
          )
        ),child: IconButton(onPressed: (){
          Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
