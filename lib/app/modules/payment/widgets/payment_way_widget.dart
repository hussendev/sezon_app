import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../auth/views/widgets/app_elevation_button.dart';
import '../../home/views/widgets/app_build_type.dart';

class PaymentWayWidget extends StatelessWidget {
  const PaymentWayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          )
      ),
      child: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 16.w,vertical:   30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBuildType(type: 'Choose Payment Way'),
            // AppTextFormField(
            //   label: 'Choose Payment Way',
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your ';
            //     }
            //   },
            //   textEditingController: TextEditingController(),
            //
            // ),19.ph(),
            // AppTextFormField(
            //   label: 'Region',
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your region';
            //     }
            //   },
            //   textEditingController: TextEditingController(),
            //
            // ),19.ph(),
            // AppTextFormField(
            //   label: 'City',
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your city';
            //     }
            //   },
            //   textEditingController: TextEditingController(),
            //
            // ),19.ph(),
            // AppTextFormField(
            //   label: 'Street',
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your street';
            //     }
            //   },
            //   textEditingController: TextEditingController(),
            //
            // ),19.ph(),
            // AppTextFormField(
            //   label: 'Postal Code',
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your postal code';
            //     }
            //   },
            //   textEditingController: TextEditingController(),
            //
            // ),19.ph(),
            // AppTextFormField(
            //   label: 'Phone Number',
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your phone number';
            //     }
            //   },
            //   textEditingController: TextEditingController(),
            //
            // ),19.ph(),


            // const SizedBox(height: 16,),
            ListTile(
              title: const Text('Visa'),
              leading: Icon(Icons.payments),
              trailing: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {
                  // setState(() {
                  //   _radioValue = value;
                  // });
                },
              ),
            ),
            ListTile(
              title: const Text('Master Card'),
              leading: Icon(Icons.money),
              trailing: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {
                  // setState(() {
                  //   _radioValue = value;
                  // });
                },
              ),
            ),
            ListTile(
              title: const Text('Convert Bank'),
              leading: Icon(Icons.food_bank),
              trailing: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {
                  // setState(() {
                  //   _radioValue = value;
                  // });
                },
              ),
            ),
            AppElevationButton(
              onTap: () {
                Get.back();
              },
              label: 'Save',
            )
          ],
        ),
      ),
    );
  }
}
