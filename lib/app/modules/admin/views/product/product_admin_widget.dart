import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sezon_app/app/modules/admin/views/product/product_admin_details.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../../core/shared_widget/app_text.dart';

class ProductAdminWidget extends StatelessWidget {
  const ProductAdminWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:  Container(
        padding: EdgeInsets.all(8.w),
        // color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            10.pw(),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    AppText(
                      text: 'خزف ملون',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                        text:
                        'هذا النص هو مثال لنص يمكن أن يستبدل توليد هذا النص من مولد  النص العربى...',
                        fontSize: 10.sp),
                    Row(
                      children: [
                        AppText(
                          text: '150ر.س',
                          fontSize: 12.sp,
                          color: Colors.red,
                        ),
                        Spacer(),
                        AppText(
                          text: 'عمليات الشراء: 10',
                          fontSize: 10.sp,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      onTap: () {
        Get.to(
          const ProductAdminDetails(),

        );
        // Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {
        //   'product': product,
        //
      },
    );
  }
}
