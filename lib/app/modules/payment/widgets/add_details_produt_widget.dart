import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../auth/views/widgets/app_elevation_button.dart';
import '../../home/views/widgets/app_build_type.dart';

class DetailsProductWidget extends StatelessWidget {
  const DetailsProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          )
      ),
      child: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 16.w,vertical:   30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBuildType(type: 'Add Details Product'),
            20.ph(),
            AppTextFormField(
              label: 'Name Product',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name product';
                }
              },
              textEditingController: TextEditingController(),

            ),19.ph(),
            AppTextFormField(
              label: 'Quantity',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter quantity';
                }
                return null;
              },
              textEditingController: TextEditingController(),

            ),19.ph(),
            AppTextFormField(
              label: 'Color',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter color';
                }
              },
              textEditingController: TextEditingController(),

            ),19.ph(),
            AppTextFormField(
              label: 'Size',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter size';
                }
              },
              textEditingController: TextEditingController(),

            ),
            Spacer(),


            // const SizedBox(height: 16,),
            AppElevationButton(
              onTap: () {
                Get.back();
              },
              label: 'Save',
            )
          ],
        ),
      ),
    );
  }
}
