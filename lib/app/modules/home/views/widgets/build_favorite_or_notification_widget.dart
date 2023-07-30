import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:sezon_app/app/modules/home/models/notification.dart';
import '../../../../core/shared_widget/app_text.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';


import '../../models/product.dart';

class BuildFavoriteOrNotificaitonWidget extends StatelessWidget {
  BuildFavoriteOrNotificaitonWidget({
    super.key,
    this.isFavorite = false,
    required this.product,
    required this.notification,
    
  });

  NotificationModel? notification;
  bool isFavorite;
  Product? product;

  @override
  Widget build(BuildContext context) {
    return isFavorite
        ? Row(
            children: [
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product!.images[0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey[200],
                ),
              ),
              15.pw(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: product!.name, fontSize: 14.sp),
                  AppText(text: product!.details, fontSize: 14.sp),
                  AppText(
                    text: '${product!.price}ر.س ',
                    fontSize: 14.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final controller = Get.find<FavoriteGetXController>();

                  // Call unFavoriteProduct in the controller and update the UI
                  controller.addProductToFavorites(product!, FirebaseAuth.instance.currentUser!.uid);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          )
        : ListTile(
            title:  Text(notification!.title),
            subtitle:  Text(notification!.body),
            trailing: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage(notification!.image),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
            ),
          );
  }
}
