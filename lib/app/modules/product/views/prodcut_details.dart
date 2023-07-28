import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';
import '../../../core/shared_widget/app_text.dart';
import '../../home/models/product.dart';
import '../widgets/product_widget.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  var controllerFav = Get.find<FavoriteGetXController>();
  var controllerHome = Get.find<HomeGetXController>();
  @override
  Widget build(BuildContext context) {
    Product product = Product.fromJson(ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
    controllerHome.getProductsByCategory(id: product.categoryId, productId: product.id);
    return Scaffold(
        appBar: AppBar(
          title: AppText(text: product.name, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        body: Obx(() {
          return controllerHome.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          for (var i = 0; i < product.images.length; i++)
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: NetworkImage(product.images[i]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                      AppText(
                        text: product.name,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        text: product.price.toString(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      AppText(
                        text: product.details,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20.h,
                            width: 4.w,
                            decoration: BoxDecoration(
                              color: Color(0xffD92728),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          10.pw(),
                          AppText(text: 'Related Products', fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ],
                      ),
                      SizedBox(
                        height: 150.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controllerHome.productsByCategory.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductWidget(
                              oldProduct: product,
                              isHome: false,
                              product: controllerHome.productsByCategory.value[index],
                              isDetails: true,
                            );
                            // return const Text('data');
                          },
                          separatorBuilder: (context, index) {
                            return 10.pw();
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    bottomLeft: Radius.circular(5.r),
                                  ),
                                  color: Color(0xffD92728),
                                ),
                                child: Center(
                                  child: AppText(
                                    text: 'Buy Now',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.toNamed(Routes.PAYMENT);
                              },
                            ),
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffD92728)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r),
                                ),
                              ),
                              child: Center(
                                child: AppText(
                                  text: 'Add to Favorite',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            onTap: () {
                              controllerFav.addProductToFavorites(product, FirebaseAuth.instance.currentUser!.uid);
                            },
                          )),
                        ],
                      )
                    ],
                  ),
                );
        })
        // body: GetX<ProductGetXController>(
        //   builder: (controller) => controller.loading.value ? const Center(child: CircularProgressIndicator(),) :
        );
  }
}
