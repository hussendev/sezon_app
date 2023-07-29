import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sezon_app/app/core/shared_widget/app_text.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

class ProfilePage extends StatelessWidget {
  // final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 60,
              // backgroundImage: NetworkImage(profileController.userProfile.value.photoUrl),
            ),
          20.ph(),
          AppText(text: 'Admin', fontSize: 20.sp, fontWeight: FontWeight.bold),
           10.ph(),
            AppText(text: 'admin@gmail.com', fontSize: 16.sp),

            30.ph(),
           AppElevationButton(label: 'logout'.tr, onTap: () {
             Get.offAllNamed(Routes.AUTH);
           },)
          ],
        ),
      ),
    );
  }
}