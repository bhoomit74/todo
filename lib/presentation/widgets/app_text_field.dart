import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final TextStyle? hintStyle;
  final Color cursorColor;
  final double cursorWidth;
  final Widget? prefixIcon;
  const AppTextField(
      {super.key,
      required this.controller,
      this.focusNode,
      required this.hint,
      this.cursorColor = AppColors.primary,
      this.cursorWidth = 0.8,
      this.hintStyle,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: cursorColor,
        cursorWidth: cursorWidth,
        style: AppTextStyle.body(),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintStyle ?? AppTextStyle.body(color: AppColors.grey),
          contentPadding: AppConstants.padding16,
          fillColor: AppColors.blue100,
          filled: true,
          border: _border,
          focusedBorder: _focusedBorder,
          enabledBorder: _border,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(maxHeight: 24),
        ));
  }

  OutlineInputBorder get _border => OutlineInputBorder(
      borderRadius: AppConstants.borderRadius24,
      borderSide: const BorderSide(width: 0, color: AppColors.transparent));

  OutlineInputBorder get _focusedBorder => OutlineInputBorder(
      borderRadius: AppConstants.borderRadius24,
      borderSide: const BorderSide(width: 0.8, color: AppColors.grey));
}
