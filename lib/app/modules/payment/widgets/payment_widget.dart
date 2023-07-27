import 'package:flutter/material.dart';

import '../../../../core/shared_widget/app_text.dart';

class PaymentWidget extends StatelessWidget {
  PaymentWidget({
    super.key,
    required this.name,
    required this.iconData,
    required this.onTap,
  });
  String name;
  IconData iconData;
  Function()? onTap;
  // FutureX

  @override
  Widget build(BuildContext context) {
    return Card(
      child:   ListTile(
        onTap:onTap,
        leading: Icon(
          iconData,
          color: Colors.black,
        ),
        title: AppText(text:name,fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black,),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}
