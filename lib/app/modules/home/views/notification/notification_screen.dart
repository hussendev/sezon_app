import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/views/widgets/build_favorite_or_notification_widget.dart';
import '../../controllers/home_controller.dart';

class NotificationWidget extends GetView<HomeGetXController> {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.notification.length,
              itemBuilder: (context, index) {
                return BuildFavoriteOrNotificaitonWidget(
                  isFavorite: false,
                  product: null,
                  notification: controller.notification[index],
                );
                // return Text('data');
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
          ));
  }
}
