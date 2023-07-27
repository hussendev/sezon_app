import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/core/shared_widget/app_text.dart';
import 'package:sezon_app/utils/extensions/sized_box_extension.dart';

class AppBuildType extends StatelessWidget {
  AppBuildType({
    super.key,
    required this.type,
  });
  String type ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.h,
          width: 4.w,
          decoration: BoxDecoration(
            color:const Color(0xffD92728) ,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        10.pw(),
        AppText(text:type, fontSize: 18.sp,fontWeight: FontWeight.bold),
      ],
    );
  }
}
