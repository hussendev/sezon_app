import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sezon_app/app/core/shared_widget/app_bar_widget.dart';
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
      appBar: AppBarWidget(isHome: false, title: controller.widgets[controller.currentIndex.value].title,),
      floatingActionButton:controller.currentIndex.value==0? FloatingActionButton(
        onPressed: () {
          Get.to(const AddProductAdminScreen());
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ) :const SizedBox(),
      body: controller.widgets[controller.currentIndex.value].widget,
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
