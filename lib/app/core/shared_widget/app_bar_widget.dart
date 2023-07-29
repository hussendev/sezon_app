import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/modules/home/views/notification/notification_screen.dart';
import 'package:sezon_app/app/utils/localizations/translation_contoller.dart';
import 'package:sezon_app/app/utils/storage/cach_helper.dart';

import '../../routes/app_pages.dart';
import 'app_text.dart';

AppBar AppBarWidget({HomeGetXController? controller,required String title,bool isHome = false}) {
  return isHome?  AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        radius: 20.r,
      ),
    ),
    actions: [
      PopupMenuButton(
        offset: const Offset(0, 50),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  controller!.changeIndex(4);
                  Get.back();
                  // print('object');
                  // Get.toNamed(Routes.NOTIFICATION);
                },
                title: AppText(text: 'notification'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.notifications),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                onTap: () {

                  CacheHelper.getData(key: 'lang') == 'ar'
                      ?  TranslationController.changeLang('en')
                      :  TranslationController.changeLang('ar');
                  Get.back();

                  // TranslationController.changeLang('ar');
                },
                title: AppText(text: 'change_language'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.language),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAllNamed(Routes.AUTH);
                },
                title: AppText(text: 'logout'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.logout),
              ),
            ),
          ];
        },
      ),
    ],
    title: AppText(text: title, fontSize: 18.sp, fontWeight: FontWeight.bold),
  ) : AppBar(
    actions: [
      PopupMenuButton(
        offset: const Offset(0, 50),
        itemBuilder: (context) {
          return [

            PopupMenuItem(
              child: ListTile(
                onTap: () {

                  CacheHelper.getData(key: 'lang') == 'ar'
                      ?  TranslationController.changeLang('en')
                      :  TranslationController.changeLang('ar');
                  Get.back();

                  // TranslationController.changeLang('ar');
                },
                title: AppText(text: 'change_language'.tr, fontSize: 15.sp),
                trailing: const Icon(Icons.language),
              ),
            ),

          ];
        },
      ),
    ],
    title: AppText(text: title.tr, fontSize: 18.sp, fontWeight: FontWeight.bold),
  );
}
