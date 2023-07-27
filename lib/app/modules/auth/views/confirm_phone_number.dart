import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/top_auth_widget.dart';

class ConfirmMobileNumberScreen extends StatelessWidget {
  ConfirmMobileNumberScreen({super.key, required this.phoneNumber});

  final String phoneNumber;
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopAuthWidget(),
              const Text(
                'رمز التحقق',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.black),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Text(
                  'لقد قمنا بارسال رمز التحقق إلى هذا  الرقم ${phoneNumber}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                controller: pinController,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // AppTextFormField(textEditingController: userNameController, label: 'اسم المستخدم'),
              const SizedBox(
                height: 20,
              ),
              // AppTextFormField(textEditingController: passwordController, label: 'كلمة المرور'),
              const SizedBox(
                height: 50,
              ),
              AppElevationButton(
                label: 'أرسل',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
