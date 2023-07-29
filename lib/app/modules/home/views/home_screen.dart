import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import '../../../core/shared_widget/app_bar_widget.dart';
import '../../../core/shared_widget/app_bottom_navigation_bar.dart';

class HomeScreen extends GetView<HomeGetXController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
        appBar: AppBarWidget(title:controller.widgets[controller.currentIndex.value].title, isHome: true,controller: controller,),
        body: controller.widgets[controller.currentIndex.value].widget,
        bottomNavigationBar: AppBottomNavigationBar(
          onTap: (index) {
            controller.changeIndex(index);
          },
          currentIndex: controller.currentIndex.value,
        )),
    );
  }
}