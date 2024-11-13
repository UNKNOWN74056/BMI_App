import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;
  final onchange;
  final errormessage;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onchange,
    required this.errormessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        errorText: errormessage,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }
}
