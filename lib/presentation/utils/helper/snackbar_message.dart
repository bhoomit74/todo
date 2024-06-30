import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class SnackBarMessage {
  static success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: AppTextStyle.body(color: AppColors.white)),
      backgroundColor: AppColors.green,
    ));
  }

  static error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: AppTextStyle.body(color: AppColors.white)),
      backgroundColor: Colors.deepOrange,
    ));
  }
}
