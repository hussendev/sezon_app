import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../core/shared_widget/app_text.dart';
import '../../home/models/product.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    this.isHome = false,
    this.isDetails = false,
    required this.product,
    required this.oldProduct,
  });
  bool isHome;
  bool isDetails;
  Product oldProduct;

  Product product;
  var controller = Get.find<HomeGetXController>();

  @override
  Widget build(BuildContext context) {
    return isHome
        ? InkWell(
            child: Container(
              height: 199.h,
              width: 162.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.network(product.image),
                    Container(
                      height: 135.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(product.images[0]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    10.ph(),
                    AppText(text: product.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
                    8.ph(),
                    AppText(
                      text: product.price.toString(),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.PRODUCTDETAILS, arguments: product.toJson());
            },
          )
        : isDetails
            ? GestureDetector(
                child: Container(
                  height: 143.h,
                  width: 119.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 83.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(product.images[0]),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey[200],
                          ),
                        ),
                        AppText(text: product.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
                        AppText(
                          text: '${product.price} ر.س',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Get.toNamed(Routes.PRODUCTDETAILS, arguments: product.toJson());
                },
              )
            : InkWell(
                onTap: () {
                  Get.toNamed(Routes.PRODUCTDETAILS, arguments: product.toJson());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 83.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(product.images[0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey[200],
                          ),
                        ),
                        AppText(text: product.name, fontSize: 12.sp, fontWeight: FontWeight.bold),
                        AppText(
                          text: '${product.price}  ر.س',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
