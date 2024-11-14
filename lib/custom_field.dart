import 'package:flutter/material.dart';
import 'package:test_app/styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    this.onTap, // Tambahkan parameter onTap
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;
  final VoidCallback? onTap; // Parameter onTap

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyles.body,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isObscure,
      onTap: onTap, // Tambahkan onTap di sini
      decoration: InputDecoration(
        suffixIcon: hasSuffix
            ? IconButton(
          onPressed: onPressed,
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
          ),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: AppColors.darkGrey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: AppColors.darkGrey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: hint,
        hintStyle: TextStyles.body,
      ),
    );
  }
}