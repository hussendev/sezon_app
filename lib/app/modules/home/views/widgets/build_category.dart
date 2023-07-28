import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/modules/home/models/category.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../../core/shared_widget/app_text.dart';

class BuildCategory extends StatelessWidget {
  BuildCategory({super.key, required this.category});

  Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44.h,
          width: 44.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(category.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[200],
          ),
        ),
        10.ph(),
        AppText(text: category.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
      ],
    );
  }
}
