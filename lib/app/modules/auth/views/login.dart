import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:sezon_app/app/modules/auth/views/register.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/top_auth_widget.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../core/shared_widget/app_text.dart';

class LoginScreen extends GetView<AuthGetXController> {
  //customer user
  // email : hussen@gmail.com
  // password : 123456


  //admin user
  //i dont create admin user in database so i login useing if condition
  // email : admin@gmail.com
  // password : 123456
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
             () => controller.loading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Form(
              key: controller.key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TopAuthWidget(),
                    AppText(text: 'login'.tr, fontSize: 30.sp, fontWeight: FontWeight.bold),
                    20.ph(),
                    AppTextFormField(
                      textEditingController: controller.emailController,
                      label: 'email'.tr,
                      keyboardType: TextInputType.name,
                      validator: (v) {
                        if (controller.emailController.text.isEmpty) {
                          return 'email_required'.tr;
                        }
                        return null;
                      },
                    ),
                    20.ph(),
                    AppTextFormField(
                      textEditingController: controller.passwordController,
                      label: 'password'.tr,
                      keyboardType: TextInputType.name,
                      validator: (v) {
                        if (controller.passwordController.text.isEmpty) {
                          return 'please_enter_password'.tr;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child:  Text(
                              'forget_password'.tr,
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.ph(),
                    AppElevationButton(
                      label: 'login'.tr,
                      onTap: () async {
                        if (controller.key.currentState!.validate()) {
                          await login(context);
                        }
                      },
                    ),
                    30.ph(),
                    RichText(
                      text: TextSpan(
                        text: 'dont_have_account'.tr,
                        style: const TextStyle(color: Colors.black87, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'new_account'.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                            style: const TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  login(BuildContext context) async {

    if(controller.emailController.text.contains( 'admin')){
      Get.offAllNamed(Routes.ADMIN);
    }
    bool loggedIn = await controller.signIn(email: controller.emailController.text, password: controller.passwordController.text, context: context);

    if (loggedIn ) {

      Get.offAllNamed(Routes.HOME);
    } else {
      print('Wrong');
    }
  }
}
