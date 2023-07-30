import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/core/shared_widget/app_text.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hinttext,
    required this.labeltext,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscuresText = false,
    required this.controller,
    this.suffixIcon,
  }) : super(key: key);
  final String hinttext;
  final String labeltext;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  // final Color focusedBorderColor;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscuresText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscuresText,
      decoration: InputDecoration(
        // labelStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle(color: Colors.redAccent),

// floatingLabelStyle: const TextStyle(color: Colors.black),

        // contentPadding: EdgeInsets.zero,
        hintText: hinttext,
        labelText: labeltext,
        // label: AppText(text:,fontSize: 18.sp,),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(color: Colors.redAccent),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(color: color),
    );
  }
}
