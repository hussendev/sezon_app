import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/app/modules/payment/widgets/payment_data_widget.dart';
import 'package:sezon_app/app/modules/payment/widgets/payment_widget.dart';
import 'package:sezon_app/core/shared_widget/app_text.dart';

import '../controllers/payment_controller.dart';
import '../widgets/add_details_produt_widget.dart';
import '../widgets/address_widget.dart';
import '../widgets/payment_way_widget.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Process to Payment',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            PaymentWidget(
              name: 'Add Address',
              iconData: Icons.location_on_sharp,
              onTap: () {
                // ScaffoldMessenger.of(context).sh
                return AppShowModalBottomSheet(context, const AddressWidget(), 750);
                // Get.toNamed('/address_screen');
              },
            ),
            PaymentWidget(
              name: 'Chose Payment Way',
              iconData: Icons.location_on_sharp,
              onTap: () {
                return AppShowModalBottomSheet(context, const PaymentWayWidget(), 367);
              },
            ),
            PaymentWidget(
              name: 'Add Details Product',
              iconData: Icons.location_on_sharp,
              onTap: () {
                return AppShowModalBottomSheet(context, const DetailsProductWidget(), 474);
              },
            ),
            const Spacer(),
            AppElevationButton(
              onTap: () {
                AppShowModalBottomSheet(context, const PaymentDataWidget(), 402);
              },
              label: 'Confirm Order',
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> AppShowModalBottomSheet(BuildContext context, Widget widget, int height) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return widget;
      },
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: height.h,
        // minHeight: 500.h
      ),
      backgroundColor: Colors.transparent,
      // isScrollControlled: true,
    );
  }
}
