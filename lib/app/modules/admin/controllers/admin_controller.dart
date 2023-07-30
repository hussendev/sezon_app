import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sezon_app/app/core/shared_widget/app_text.dart';
import 'package:sezon_app/app/modules/admin/views/widgets/home_admin_widget.dart';
import 'package:sezon_app/app/modules/admin/views/widgets/order_admin_widget.dart';
import 'package:sezon_app/app/modules/admin/views/widgets/profile_admin_widget.dart';
import 'package:sezon_app/app/modules/home/models/btn.dart';
import 'package:sezon_app/app/modules/home/models/category.dart';
import 'package:sezon_app/app/modules/home/views/notification/notification_screen.dart';

import '../../home/models/notification.dart';
import '../../home/models/product.dart';
import '../../home/services/fb_home_controller.dart';

class AdminController extends GetxController {
  //TODO: Implement AdminController
  FBHomeController fbHomeController = FBHomeController();

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  var selectedCategory=0.obs;


  List<BTN> widgets = [BTN(title: 'home'.tr, widget:  const HomeAdminWidget()) ,BTN(title: 'orders'.tr, widget: const OrderAdminWidget()) ,BTN(title: 'notification'.tr, widget: const NotificationWidget()),BTN(title: 'profile'.tr, widget: ProfilePage())];
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  // var productsByCategory = <Product>[].obs;
var currentIndex= 0.obs;
var loading =false.obs;
var loadingPickImage =false.obs;
var loadingProductByCategory =false.obs;
  @override
  void onInit() async{
    super.onInit();
  await  getHomeData();
    // await   getProductsByCategory(id: 100);
    selectedCategory.value=categories[0].id;


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
  Future<void> getHomeData() async {
    await getCategories();
    await getProducts();

  }
  Future<List<Product>> getProducts({bool isHome=false}) async {
    isHome? loadingProductByCategory.value = true :loading.value=true ;
    products.value = [];

    var productsFormFirebase = await fbHomeController.getProducts();
    for (var element in productsFormFirebase.docs) {
      print(productsFormFirebase.docs.length);
      print(element);
      products.add(element.data());
    }
    isHome? loadingProductByCategory.value = false :loading.value=false ;
    return products;
  }
  Future<List<Category>> getCategories() async {
    loading.value = true;
    var categoriesFormFirebase = await fbHomeController.getCategories();
    for (var element in categoriesFormFirebase.docs) {
      categories.add(element.data());
    }
    loading.value = false;
    return categories;
  }
  Future<List<Product>> getProductsByCategory({required int id, int productId = 0}) async {
    loadingProductByCategory.value = true;
    products.value = [];

    var productsFormFirebase = await fbHomeController.getProductsByCategory(categoryId: id, productId: productId);
    for (var element in productsFormFirebase.docs) {
      products.add(element.data());
    }
    loadingProductByCategory.value = false;
    update();
    return products;
  }
  Category getCategoryFromId(int id ){
   return categories.where((element) => element.id == id).first;
  }
  Future<bool> addProduct(Product product) async {
    loading.value = true;
    NotificationModel notification = NotificationModel(
      body:product.details ,
      title: product.name,
      image:product.images.first ,date:DateTime.now().toString(), id: null
    );

    var result = await fbHomeController.addProduct(product);
     var sendNotification = await fbHomeController.addNotification(notification);

    loading.value = false;
    await getProducts();
    return result;
  }
  //selectImage
  Future<void> selectImage() async {
    loadingPickImage.value = true;
    Get.dialog(
      AlertDialog(
        title:AppText(text: 'Select Image',fontSize: 18.sp),
        content:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () async {
                var image = await _imagePicker.pickImage(source: ImageSource.camera);
                await fbHomeController.uploadImage(File(image!.path));

                productImageController.text =  await fbHomeController.getImage(image.path);
                loadingPickImage.value = false;
                Get.back();
              },
              title: AppText(text: 'Camera',fontSize: 18.sp),
              leading: const Icon(Icons.camera),
            ),
            ListTile(
              onTap: () async {
                var image = await _imagePicker.pickImage(source: ImageSource.gallery);
                await fbHomeController.uploadImage(File(image!.path));
                productImageController.text = await fbHomeController.getImage(image.path);
                loadingPickImage.value = false;
                Get.back();
              },
              title:AppText(text: 'Gallery',fontSize: 18.sp),
              leading: const Icon(Icons.image),
            ),
          ],
        )
      ),
    );
    loadingPickImage.value = false;
    // _imagePicker.
    // XFile path = await fbHomeController.selectImage();
    //   print(path.path);
    // return path.path;
  }

}
