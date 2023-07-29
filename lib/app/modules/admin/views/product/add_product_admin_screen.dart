import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/core/shared_widget/app_text_field.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/modules/home/views/widgets/app_build_type.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

class AddProductAdminScreen extends StatelessWidget {
  const AddProductAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        elevation: 0.5,
         backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBuildType(type: 'Add New Product'),
            // 15.ph(),
            AppTextFormField(
              label: 'Product Name',
              hint: 'خزف ملون صنع يدوي',
              textEditingController: TextEditingController(),
            ),
            AppTextFormField(
              label: 'Product Description',
              hint: 'مثال: منتج تم صناعته بافضل الخامات...',
              textEditingController: TextEditingController(),
            ),
            AppTextFormField(
              label: 'Product Price',
              hint: '130ر.س',
              textEditingController: TextEditingController(),
            ),
            AppTextFormField(
              label: 'Product Image',
              hint: 'ارفق صورة',
              textEditingController: TextEditingController(),
              suffixIcon:  Icon(Icons.upload),
            ),

            // Obx(() => ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelStyle: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16.sp,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                labelText: 'Product Category',

                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 16.sp,
              ),
              items: const[
                DropdownMenuItem(
                  value: "1",
                  child: Text(
                    "High Priority",
                  ),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text(
                    "Medium Priority",
                  ),
                ),
                DropdownMenuItem(
                  value: "3",
                  child: Text(
                    "Low Priority",
                  ),
                ),
              ],
              value:'3',
              hint: const Text('Select Task Priority'),
              isExpanded: true,
              onChanged: (selectedValue) {
                // controller.selectedPriority.value =
                //     int.parse(selectedValue);
              },
            ),
             // const Spacer(),
            AppElevationButton(label: 'Add', onTap: () {

            },)

          ],
        )
      )

    );
  }
}
