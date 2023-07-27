import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/core/shared_widget/empty_widget.dart';
import 'package:sezon_app/utils/extensions/sized_box_extension.dart';

import '../../../product/widgets/product_widget.dart';
import '../widgets/build_category.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  // var controller= Get.find<HomeGetXController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeGetXController>(
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: BuildCategory(
                            category: controller.categories[index],
                          ),
                        ),
                        controller.currentIndexInCategory == index
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.red,
                                ),
                                height: 100,
                                width: 5,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  onTap: () {
                    controller.changeIndexInCategory(index);
                    controller.getProductsByCategory(id: controller.categories[index].id);
                  },
                );
                // return Text('');
              },
              separatorBuilder: (context, index) {
                return 30.ph();
              },
            ),
          )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.productsByCategory.isNotEmpty
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.productsByCategory.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                            ),
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                isHome: false,
                                product: controller.productsByCategory[index],
                                oldProduct: controller.productsByCategory[index],
                              );
                              // return Text('data');
                            },
                          )
                        : EmptyWidget(),
              )),
        ],
      ),
    );
  }
}
