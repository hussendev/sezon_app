import 'package:flutter/material.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../home/views/widgets/build_order_widget.dart';

class OrderAdminWidget extends StatelessWidget {
  const OrderAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return 10.ph();
      },
      itemBuilder: (context, index) =>  const BuildOrderWidget()
    );
  }
}
