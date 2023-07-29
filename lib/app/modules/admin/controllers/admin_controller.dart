import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/admin/views/widgets/home_admin_widget.dart';
import 'package:sezon_app/app/modules/admin/views/widgets/order_admin_widget.dart';
import 'package:sezon_app/app/modules/home/views/notification/notification_screen.dart';

class AdminController extends GetxController {
  //TODO: Implement AdminController
  List<Widget> widgets = [HomeAdminWidget(), OrderAdminWidget(),NotificationWidget(),NotificationWidget()];

  // TabController? tabController = TabController(length: 3, vsync: NavigatorState());
var currentIndex= 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    // update();
  }
  void increment() => count.value++;
}
