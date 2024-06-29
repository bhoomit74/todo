import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class AppLabel extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color bgColor;
  final Function()? onPressed;
  const AppLabel(
      {super.key,
      required this.label,
      this.textColor = AppColors.white,
      this.bgColor = AppColors.primary,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed?.call,
      child: Chip(
        label: Text(label, style: AppTextStyle.captionBold(color: textColor)),
        backgroundColor: bgColor,
        side: const BorderSide(color: Colors.transparent, width: 0),
        padding: AppConstants.paddingH8,
        shape:
            RoundedRectangleBorder(borderRadius: AppConstants.borderRadius16),
      ),
    );
  }
}
