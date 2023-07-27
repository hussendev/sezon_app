import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.keyboardType,
    required this.validator,
  });

  final TextEditingController textEditingController;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String? v) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        cursorColor: Colors.redAccent,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: Colors.black54),
          ),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
