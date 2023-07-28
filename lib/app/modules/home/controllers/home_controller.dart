import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/views/btn/favoriat_widget.dart';
import 'package:sezon_app/app/modules/home/views/notification/notification_screen.dart';
import 'package:sezon_app/app/modules/home/models/category.dart';
import 'package:sezon_app/app/modules/home/home/fb_home_controller.dart';

import '../models/product.dart';
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
  int currentIndex = 0;
  int currentIndexInCategory = 0;
  List<Widget> widgets = [HomeWidget(), CategoryWidget(), const OrderWidget(), FavoriteWidget(), const NotificationWidget()];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  void changeIndexInCategory(int index) {
    currentIndexInCategory = index;
    update();
  }

  Future<void> getHomeData() async {
    await getProducts();
    await getCategories();
  }

  // getProductById2(Product product1) {
  //   product.value = product1;
  //   update();
  // }

  // Product getProductById(int id) {
  //   loading.value = true;
  //   Product p = products.where((p0) {
  //     return p0.id == id;
  //   }).first;
  //   product = Rx(p);
  //   loading.value = false;
  //   return product.value;
  //   // return
  // }

  Future<List<Product>> getProducts() async {
    loading.value = true;
    var productsFormFirebase = await fbHomeController.getProducts();
    for (var element in productsFormFirebase.docs) {
      products.value.add(element.data());
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
      productsByCategory.value.add(element.data());
    }
    loading.value = false;
    update();
    return productsByCategory.value;
  }

  Future<List<Category>> getCategories() async {
    loading.value = true;
    var categoriesFormFirebase = await fbHomeController.getCategories();
    for (var element in categoriesFormFirebase.docs) {
      categories.value.add(element.data());
    }
    loading.value = false;
    update();
    return categories;
  }
}
