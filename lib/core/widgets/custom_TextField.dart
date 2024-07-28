import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
  });

  final String hintText;
  bool obscureText;

  final FormFieldValidator? validator;
  final TextEditingController controller;
  Widget? suffixIcon;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextFormField(
      cursorColor: theme.primaryColor,
keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15)),
          hintStyle: theme.textTheme.bodySmall!
              .copyWith(color: const Color(0xFF000000))),
    );
  }
}
