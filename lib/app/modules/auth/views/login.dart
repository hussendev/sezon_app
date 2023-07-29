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
                    AppText(text: 'Login', fontSize: 30.sp, fontWeight: FontWeight.bold),
                    20.ph(),
                    AppTextFormField(
                      textEditingController: controller.emailController,
                      label: 'Email',
                      keyboardType: TextInputType.name,
                      validator: (v) {
                        if (controller.emailController.text.isEmpty) {
                          return 'email required';
                        }
                        return null;
                      },
                    ),
                    20.ph(),
                    AppTextFormField(
                      textEditingController: controller.passwordController,
                      label: 'Password',
                      keyboardType: TextInputType.name,
                      validator: (v) {
                        if (controller.passwordController.text.isEmpty) {
                          return 'please enter password';
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
                            child: const Text(
                              'Forget Password ?',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.ph(),
                    AppElevationButton(
                      label: 'Login',
                      onTap: () async {
                        if (controller.key.currentState!.validate()) {
                          await login(context);
                        }
                      },
                    ),
                    30.ph(),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have account ?',
                        style: const TextStyle(color: Colors.black87, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'New Account',
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
