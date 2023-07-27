import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/utils/extensions/sized_box_extension.dart';

import '../../../../../core/shared_widget/app_text_field.dart';
import '../widgets/app_build_type.dart';
import '../widgets/show_categories.dart';
import '../../../product/widgets/show_products.dart';

class HomeWidget extends StatelessWidget {
   HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeGetXController>(
      builder: (controller) {
       if(controller.loading.value){
         return const Center(child: CircularProgressIndicator());
       }else{
         return Padding(
           padding: EdgeInsets.symmetric(horizontal: 20.w),
           child: Column(
             children: [
               AppTextField(
                 labeltext: 'Search',
                 prefixIcon: Icons.search,
                 hinttext: 'Search',
                 keyboardType: TextInputType.text,
                 controller: TextEditingController(),
                 obscureText: false,
               ),
               31.ph(),
               AppBuildType(
                 type: 'Category',
               ),
               20.ph(),
                ShowCategories(categories: controller.categories),
               30.ph(),
               AppBuildType(
                 type: 'Products',
               ),
               30.ph(),
               ShowProducts(products: controller.products ),
             ],
           ),
         );
       }
      },
    );
  }
}






