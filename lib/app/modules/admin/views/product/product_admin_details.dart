import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../../core/shared_widget/app_text.dart';

class ProductAdminDetails extends StatelessWidget {
  const ProductAdminDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppText(text:' Product Details', fontSize: 20.sp, fontWeight: FontWeight.bold),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
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
                  for (var i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                        // image: DecorationImage(
                        //   image: NetworkImage(product.images[i]),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                ],
              ),
              44.ph(),
              AppText(
                text:'صواني مطرزة تطريز فلسطيني',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              10.ph(),
              AppText(
                text:'130ر.س',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              10.ph(),
              AppText(
                text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم              توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا ',
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
                text: 'خشبيات',
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
                text: ' 2021-09-09',
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
                text: '10 times',
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
