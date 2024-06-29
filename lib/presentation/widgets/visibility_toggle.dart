import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class VisibilityToggle extends StatelessWidget {
  final bool obscureText;
  final Function(bool obscureText) onChange;
  const VisibilityToggle(
      {super.key, required this.obscureText, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        color: AppColors.primary,
        onPressed: () => onChange(!obscureText));
  }
}
