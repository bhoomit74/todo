import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color bgColor;
  final Function() onPressed;
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = AppColors.white,
    this.bgColor = AppColors.btnEnd,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: AppConstants.paddingV16,
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius16),
      onPressed: onPressed,
      minWidth: double.maxFinite,
      color: bgColor,
      child: Text(label, style: AppTextStyle.button(color: textColor)),
    );
  }
}
