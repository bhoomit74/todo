import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/widgets/visibility_toggle.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hint;
  final TextStyle? hintStyle;
  final Color cursorColor;
  final double cursorWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? focusedBorderColor;
  final Function(String value)? onChanged;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? error;
  const AppTextField(
      {super.key,
      this.controller,
      this.focusNode,
      required this.hint,
      this.cursorColor = AppColors.primary,
      this.cursorWidth = 0.8,
      this.hintStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.focusedBorderColor,
      this.onChanged,
      this.textInputType,
      this.obscureText = false,
      this.error});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: widget.cursorColor,
        cursorWidth: widget.cursorWidth,
        style: AppTextStyle.body(),
        onChanged: widget.onChanged?.call,
        keyboardType: widget.textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle:
              widget.hintStyle ?? AppTextStyle.body(color: AppColors.grey),
          errorText: widget.error,
          contentPadding: AppConstants.padding16,
          fillColor: AppColors.lightGrey,
          filled: true,
          border: _border,
          focusedBorder: _focusedBorder,
          enabledBorder: _border,
          prefixIcon: Padding(
            padding: AppConstants.paddingH16,
            child: widget.prefixIcon,
          ),
          suffixIcon: widget.suffixIcon ??
              (widget.textInputType == TextInputType.visiblePassword
                  ? VisibilityToggle(
                      obscureText: obscureText,
                      onChange: (obscure) => setState(() {
                            obscureText = obscure;
                          }))
                  : null),
          prefixIconConstraints: const BoxConstraints(maxHeight: 24),
        ));
  }

  OutlineInputBorder get _border => OutlineInputBorder(
      borderRadius: AppConstants.borderRadius24,
      borderSide: const BorderSide(width: 0, color: AppColors.transparent));

  OutlineInputBorder get _focusedBorder => OutlineInputBorder(
      borderRadius: AppConstants.borderRadius24,
      borderSide: BorderSide(
          width: 0.8, color: widget.focusedBorderColor ?? AppColors.grey));
}
