// ignore_for_file: camel_case_extensions, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sezon_app/app/core/shared_widget/app_text.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension contextExtenssion on BuildContext {
  void showSnackBar({required String message, bool error = false}) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: error ? Colors.red.shade800 : Colors.green.shade800,
        dismissDirection: DismissDirection.horizontal,
        title:  message.tr,
      )
      // SnackBar(
      //   content:,
      //
      //
      //
      //
      // ),
    );
  }

  // AppLocalizations get localizations => AppLocalizations.of(this)!;


}
