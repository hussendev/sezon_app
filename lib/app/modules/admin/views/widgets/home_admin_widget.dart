import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/core/shared_widget/empty_widget.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../../core/shared_widget/app_text.dart';
import '../../../auth/views/widgets/app_text_form_field.dart';
import '../../controllers/admin_controller.dart';
import '../product/product_admin_widget.dart';

class HomeAdminWidget extends GetView<AdminController> {
  const HomeAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>controller.loading.value?Center(child: CircularProgressIndicator(),)  : Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          AppTextFormField(
            textEditingController: TextEditingController(),
            label: 'search'.tr,
            keyboardType: TextInputType.text,
          ),
          30.ph(),
          SizedBox(
              height: 24.h,
              child:  DefaultTabController(
                initialIndex: 0,
                length: controller.categories.length+1,
                child: TabBar(
                  onTap: (index) {
                    if(index ==0){
                      controller.getProducts(isHome: true);
                      return;
                    }
                    controller.getProductsByCategory(
                        id: controller.categories[index-1].id);
                  },
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    const Tab(
                      text: 'All',
                    ),
                    ...List.generate(
                        controller.categories.length,
                            (index) => Tab(
                          text: controller.categories[index].name,
                        ))
                  ]
                ),
              )),
          Expanded(
              child:!controller.loadingProductByCategory.value? controller.products.value.isNotEmpty? ListView.separated(
                physics: const BouncingScrollPhysics(),
                primary: false,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return  ProductAdminWidget(product: controller.products[index],);
                },
              ): const EmptyWidget(): const Center(child: CircularProgressIndicator(),)
          )

        ],
      ),
    ) );
  }
}

