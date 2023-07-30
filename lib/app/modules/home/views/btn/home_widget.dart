import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';
import '../widgets/app_build_type.dart';
import '../widgets/show_categories.dart';
import '../../../product/widgets/show_products.dart';

class HomeWidget extends GetView<HomeGetXController> {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                AppTextFormField(
                  textEditingController: controller.searchController,
                  label: 'search'.tr,
                  onChanged: (p0) async {
                    await controller.searchProduct();
                  },
                  // onFieldSubmitted: (p0)  {
                  //   // print(p0);
                  //    controller.searchProduct(p0);
                  // },
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
                controller.loadingSearch.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ShowProducts(products: controller.searchController.text.isEmpty?controller.products:controller.productsSearch),
              ],
            ),
          ));
  }
}
