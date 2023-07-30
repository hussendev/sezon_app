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
     this.onChanged,
     this.onSaved,
      this.onFieldSubmitted,
  });

  final TextEditingController textEditingController;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      cursorColor: Colors.redAccent,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved:onSaved,
      onFieldSubmitted: onFieldSubmitted,
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
