import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import 'app_text.dart';

AppBar AppBarWidget() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        radius: 20.r,
        // backgroundImage: const AssetImage('assets/images/avatar.png'),
      ),
    ),
    actions: [
      PopupMenuButton(
        offset: Offset(0, 50),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  // print('object');
                  Get.toNamed(Routes.NOTIFICATION);
                },
                title: AppText(text: 'Notification', fontSize: 15.sp),
                trailing: const Icon(Icons.notifications),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAllNamed(Routes.AUTH);
                },
                title: AppText(text: 'Logout', fontSize: 15.sp),
                trailing: const Icon(Icons.logout),
              ),
            ),
          ];
        },
      ),
    ],
    title: AppText(text: 'Home Screen', fontSize: 18.sp, fontWeight: FontWeight.bold),
  );
}
