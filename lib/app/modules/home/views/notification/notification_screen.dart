import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/modules/home/views/widgets/build_favorite_or_notification_widget.dart';
import 'package:sezon_app/core/shared_widget/app_text.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Notification', fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 25,
          itemBuilder: (context, index) {
            return BuildFavoriteOrNotificaitonWidget(
              isFavorite: false,
              product: null,
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
      ),
    );
  }
}
