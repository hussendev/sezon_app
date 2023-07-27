import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sezon_app/core/shared_widget/app_text.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/empty.json'),
        AppText(text: 'No Product To Show', fontSize: 18.sp, fontWeight: FontWeight.bold),
      ],
    );
  }
}
