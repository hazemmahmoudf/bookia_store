import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppButtom extends StatelessWidget {
  final String title;
  final Color backGroundColor;

  const AppButtom({super.key, required this.title, required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(style:ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
          alignment: Alignment.center,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:  BorderSide(
              color: (backGroundColor==AppColor.mainColor)?AppColor.mainColor:Colors.black,
              width: 1,
            ),
          )
      ),onPressed: (){}, child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 19.h,),
        child: Text(title,style:Theme.of(context).textTheme.titleSmall?.copyWith(
          color: (backGroundColor==AppColor.mainColor)?Colors.white:Colors.black
        )),
      )),
    ) ;
  }
}
