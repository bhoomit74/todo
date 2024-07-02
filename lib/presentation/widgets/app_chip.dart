import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class AppChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onPressed;
  const AppChip(
      {super.key,
      required this.label,
      this.isSelected = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Chip(
        label: Text(label,
            style: isSelected ? AppTextStyle.activeChip : AppTextStyle.chip),
        backgroundColor: isSelected ? AppColors.primary : AppColors.blue100,
        side: const BorderSide(color: Colors.transparent, width: 0),
        padding: AppConstants.padding14,
        shape:
            RoundedRectangleBorder(borderRadius: AppConstants.borderRadius32),
      ),
    );
  }
}
