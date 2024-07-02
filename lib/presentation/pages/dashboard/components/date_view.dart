import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class DateView extends StatelessWidget {
  final String date;
  const DateView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_month_rounded,
            color: AppColors.grey, size: 24),
        AppConstants.gap4,
        Text(
          date,
          style: AppTextStyle.caption(color: AppColors.grey),
        )
      ],
    );
  }
}
