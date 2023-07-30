import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/core/shared_widget/app_text.dart';
import 'package:sezon_app/app/modules/admin/controllers/admin_controller.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/modules/home/models/notification.dart';
import 'package:sezon_app/app/modules/home/models/product.dart';
import 'package:sezon_app/app/modules/home/views/widgets/app_build_type.dart';

import '../../../home/models/category.dart';

class AddProductAdminScreen extends GetView<AdminController> {
  const AddProductAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'add_product'.tr,fontSize: 18.sp),
        elevation: 0.5,

         backgroundColor: Colors.white,
      ),
      body:Obx(() =>controller.loading.value?Center(child: CircularProgressIndicator(),):  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBuildType(type: 'add_new_product'.tr),
              // 15.ph(),
              AppTextFormField(
                label: 'product_name'.tr,
                hint: 'خزف ملون صنع يدوي',
                textEditingController:controller.productNameController,
              ),
              AppTextFormField(
                label: 'product_description'.tr,
                hint: 'مثال: منتج تم صناعته بافضل الخامات...',
                textEditingController: controller.productDescriptionController,
              ),
              AppTextFormField(
                label: 'product_price'.tr,
                hint: '130ر.س',
                textEditingController:controller.productPriceController,
              ),
              InkWell(
                onTap: ()async {
               await   controller.selectImage();
                },
                child:  controller.loadingPickImage.value?   const Center(child: CircularProgressIndicator()): Container(
                  padding: EdgeInsets.only(right: 10.w),
                  height: 50.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            controller.productImageController.text.isEmpty? 'product_image'.tr: controller.productImageController.text,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.drive_folder_upload_outlined ,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              DropdownButtonFormField<Category>(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  labelText: 'product_category'.tr,

                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16.sp,
                ),
                items:controller.categories.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
                value:controller.categories[0],
                hint:  Text('select_category'.tr),
                isExpanded: true,
                onChanged: (selectedValue) {
                  controller.selectedCategory.value =
                      selectedValue!.id;
                },
              )
          ,

              // const Spacer(),
              AppElevationButton(label: 'add'.tr, onTap: ()async {
              await  addProduct(product);

              },)

            ],
          )
      ))

    );
  }

  bool checkIfNull(){
    if(controller.productNameController.text.isEmpty){
      Get.snackbar('Error', 'enter_product_name'.tr);
      return false;
    }
    if(controller.productDescriptionController.text.isEmpty){
      Get.snackbar('Error', 'enter_product_description'.tr);
      return false;
    }
    if(controller.productPriceController.text.isEmpty){
      Get.snackbar('Error', 'enter_product_price'.tr);
      return false;
    }
    if(controller.productImageController.text.isEmpty){
      Get.snackbar('Error', 'select_product_image'.tr);
      return false;
    }

    return true;
  }

  addProduct(Product product) async {
    if(checkIfNull()){
  bool added= await controller.addProduct(product);
  if(added){
    controller.productNameController.clear();
    controller.productImageController.clear();
    controller.productPriceController.clear();
    controller.productDescriptionController.clear();
    controller.productDescriptionController.clear();

    Get.back();
  }
  // added? Get.back():Get.snackbar('Error', 'Something went wrong');
    }else{
      return;
    }
  }

  Product get product => Product(
    name: controller.productNameController.text,
    dateAdded: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
    details: controller.productDescriptionController.text,
    price: controller.productPriceController.text,

    images: [controller.productImageController.text],
    purchaseCount: 0,
    categoryId: controller.selectedCategory.value, id: controller.products.length+1
  );

  // NotificationModel get notification => NotificationModel(
  //   title: 'تم اضافة منتج جديد',
  //   body: 'تم اضافة منتج جديد بواسطة المتجر',
  //   date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
  //   image: controller.productImageController.text,
  //   id: null
  // );
}
