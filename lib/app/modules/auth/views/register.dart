import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/top_auth_widget.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../core/shared_widget/app_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final _key = GlobalKey<FormState>();

  var controller = Get.find<AuthGetXController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GetX<AuthGetXController>(
              builder: (controller) => controller.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const TopAuthWidget(),
                            AppText(
                              text: 'Create new account',
                              fontWeight: FontWeight.w700,
                              fontSize: 30.sp,
                            ),
                            // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                            // ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: emailController,
                              label: 'Email',
                              keyboardType: TextInputType.name,
                              validator: (v) {
                                if (emailController.text.isEmpty) {
                                  return 'email is required';
                                }
                                return null;
                              },
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: phoneNumberController,
                              label: 'Phone Number',
                              keyboardType: TextInputType.phone,
                              validator: (v) {
                                if (phoneNumberController.text.isEmpty) {
                                  return 'Phone Number required';
                                }
                                return null;
                              },
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: passwordController,
                              label: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: (v) {
                                if (passwordController.text.isEmpty) {
                                  return 'please enter password';
                                }
                                return null;
                              },
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: confirmPasswordController,
                              label: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: (v) {
                                if (confirmPasswordController.text.isEmpty) {
                                  return 'Please Confirm Password';
                                }
                                return null;
                              },
                            ),
                            30.ph(),
                            AppElevationButton(
                              label: 'Create Account',
                              onTap: () async {
                                if (_key.currentState!.validate()) {
                                  await createAccount(context);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ConfirmMobileNumberScreen(phoneNumber: phoneNumberController.text),
                                  //   ),
                                  // );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Do You Have Account ? ',
                                style: TextStyle(color: Colors.black87, fontSize: 16.sp),
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
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
                            30.ph()
                          ],
                        ),
                      ),
                    ))),
    );
  }

  createAccount(BuildContext context) async {
    bool success = await controller.createAccount(email: emailController.text, password: passwordController.text, phone: phoneNumberController.text, context: context);

    if (success) {
      Get.offAllNamed(Routes.HOME);
    } else {
      print('Wrong');
    }
  }
}
