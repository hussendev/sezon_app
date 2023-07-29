import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';
import 'package:sezon_app/app/utils/localizations/translation.dart';
import '../../../../core/shared_widget/app_text_field.dart';
import '../widgets/app_build_type.dart';
import '../widgets/show_categories.dart';
import '../../../product/widgets/show_products.dart';

class HomeWidget extends StatelessWidget {
   const HomeWidget({super.key});
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
                 labeltext:'search'.tr,
                 prefixIcon: Icons.search,
                 hinttext: 'search'.tr,
                 keyboardType: TextInputType.text,
                 controller: TextEditingController(),

               ),
               31.ph(),
               AppBuildType(
                 type: 'category'.tr,
               ),
               20.ph(),
                ShowCategories(categories: controller.categories),
               30.ph(),
               AppBuildType(
                 type: 'products'.tr,
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






