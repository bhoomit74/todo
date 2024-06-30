import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class LoadingDialog {
  static bool _isLoading = false;
  static show(BuildContext context) {
    if (!_isLoading) {
      _isLoading = true;
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: AlertDialog(
              elevation: double.minPositive,
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: Center(
                  child: CircularProgressIndicator(
                      backgroundColor: AppColors.transparent,
                      strokeWidth: 5,
                      color: AppColors.primary),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  static dismiss(BuildContext context) {
    if (_isLoading) {
      _isLoading = false;
      Navigator.pop(context);
    }
  }
}
