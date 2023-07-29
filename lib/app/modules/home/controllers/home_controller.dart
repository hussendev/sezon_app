import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/views/btn/favoriat_widget.dart';
import 'package:sezon_app/app/modules/home/views/notification/notification_screen.dart';
import 'package:sezon_app/app/modules/home/models/category.dart';

import '../models/btn.dart';
import '../models/product.dart';
import '../services/fb_home_controller.dart';
import '../views/btn/category_widget.dart';
import '../views/btn/home_widget.dart';
import '../views/btn/order_widget.dart';

class HomeGetXController extends GetxController {
  FBHomeController fbHomeController = FBHomeController();
  RxList<Product> products = <Product>[].obs;
  RxList<Product> productsByCategory = <Product>[].obs;
  RxList<Category> categories = <Category>[].obs;
  RxBool loading = false.obs;
  // late Rx<Product> product;

  @override
  void onInit() async {
    await getHomeData();
    await getProductsByCategory(id: categories.value[0].id);
    super.onInit();
  }

  static HomeGetXController get to => Get.find();
  var currentIndex = 0.obs;
  int currentIndexInCategory = 0;
  List<BTN> widgets = [BTN(title: 'home'.tr, widget:  const HomeWidget()) ,BTN(title: 'category'.tr, widget: const CategoryWidget()) ,BTN(title: 'favorite'.tr, widget:  FavoriteWidget()),BTN(title: 'notification'.tr, widget: NotificationWidget())];

  // List<Widget> widgets = [const HomeWidget(), CategoryWidget(),  OrderWidget(isAdmin: true), FavoriteWidget(), const NotificationWidget()];

  void changeIndex(int index) {
    currentIndex.value = index;
    // update();
  }

  void changeIndexInCategory(int index) {
    currentIndexInCategory = index;
    update();
  }

  Future<void> getHomeData() async {
    await getProducts();
    await getCategories();
  }

  Future<List<Product>> getProducts() async {
    loading.value = true;
    var productsFormFirebase = await fbHomeController.getProducts();
    for (var element in productsFormFirebase.docs) {
      products.add(element.data());
    }
    loading.value = false;
    update();
    return products;
  }

  Future<List<Product>> getProductsByCategory({required int id, int productId = 0}) async {
    loading.value = true;
    productsByCategory.value = [];

    var productsFormFirebase = await fbHomeController.getProductsByCategory(categoryId: id, productId: productId);
    print(productsFormFirebase.docs.length);
    for (var element in productsFormFirebase.docs) {
      productsByCategory.add(element.data());
    }
    loading.value = false;
    update();
    return productsByCategory;
  }

  Future<List<Category>> getCategories() async {
    loading.value = true;
    var categoriesFormFirebase = await fbHomeController.getCategories();
    for (var element in categoriesFormFirebase.docs) {
      categories.add(element.data());
    }
    loading.value = false;
    update();
    return categories;
  }
}
