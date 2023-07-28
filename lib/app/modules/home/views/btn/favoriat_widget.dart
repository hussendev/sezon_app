import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:sezon_app/app/core/shared_widget/empty_widget.dart';


import '../../models/product.dart';
import '../widgets/build_favorite_or_notification_widget.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key});

  var controller = Get.put<FavoriteGetXController>(FavoriteGetXController());
  List<Product> product = [];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        product = controller.getProductsFavorite(FirebaseAuth.instance.currentUser!.uid);
        return controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : product.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        return BuildFavoriteOrNotificaitonWidget(
                          isFavorite: true,
                          product: product[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 20.h,
                          color: Colors.grey[300],
                          endIndent: 20.w,
                          indent: 20.w,
                        );
                      },
                    ),
                  )
                : const EmptyWidget();
      },
      // builder: (controller) =>
    );
  }
}
