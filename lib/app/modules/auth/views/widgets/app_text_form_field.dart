import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.keyboardType,
    this.hint='',
    this.suffixIcon,
    this.prefixIcon,
     this.validator,
  });

  final TextEditingController textEditingController;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      cursorColor: Colors.redAccent,
      keyboardType: keyboardType,
      decoration:  InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:suffixIcon,
        prefixIcon:prefixIcon ,
        floatingLabelStyle: TextStyle(color: Colors.redAccent),

        labelText: label,
        // label: Text(,style: const TextStyle(color: Colors.grey),),
        hintText:hint ,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.shade200, width: 1.5),

          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
