import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/admin/controllers/admin_controller.dart';
import 'package:sezon_app/app/modules/home/models/product.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../../core/shared_widget/app_text.dart';

class ProductAdminDetails extends GetView<AdminController> {
   ProductAdminDetails({super.key,required this.product});
    final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppText(text:'Product Details', fontSize: 20.sp, fontWeight: FontWeight.bold),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),

          ],
        ),
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 236.h,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  // aspectRatio: 0.5,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  for (var i = 0; i <product.images.length; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: NetworkImage(product.images[i]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
              44.ph(),
              AppText(
                text:product.name,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              10.ph(),
              AppText(
                text:'${product.price.toString()} ر.س',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              10.ph(),
              AppText(
                text: product.details,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              14.ph(),
              AppText(
                text: 'Category',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              5.ph(),
              AppText(
                text:controller.getCategoryFromId(product.categoryId).name,
                fontSize: 12.sp,
                color: Colors.black,
              ),
              10.ph(),

              AppText(
                text: 'Date Added',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              5.ph(),
              AppText(
                text: product.dateAdded,
                fontSize: 12.sp,
                color: Colors.black,
              ),
              10.ph(),
              AppText(
                text: 'Purchase Count',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              5.ph(),
              AppText(
                text: '${product.purchaseCount} times',
                fontSize: 12.sp,
                color: Colors.black,
              ),

            ],
          ),
        )
      // body: GetX<ProductGetXController>(
      //   builder: (controller) => controller.loading.value ? const Center(child: CircularProgressIndicator(),) :
    );
  }
}
