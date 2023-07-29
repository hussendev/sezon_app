import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sezon_app/app/core/shared_widget/app_bottom_navigation_bar.dart';
import 'package:sezon_app/app/core/shared_widget/app_text.dart';
import 'package:sezon_app/app/modules/admin/views/product/add_product_admin_screen.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: AppText(
            text: 'Home',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddProductAdminScreen());
          // Get.bottomSheet(
          //   Container(
          //     height:500,
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(16),
          //         topRight: Radius.circular(16),
          //       ),
          //     ),
          //     child: Text('data'),
          //   ),
          //   backgroundColor: Colors.transparent,
          //   isScrollControlled: true,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(16),
          //       topRight: Radius.circular(16),
          //     ),
          //   ),
          //   enableDrag: true,
          //   isDismissible: true,
          //   elevation: 4,
          // );
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      body: controller.widgets[controller.currentIndex.value],
      bottomNavigationBar: AppBottomNavigationBar(
        isHome: false,
        currentIndex:controller.currentIndex.value,
        onTap: (index) {
          controller.changeIndex(index);
        },
      ),
    ));
  }
}
