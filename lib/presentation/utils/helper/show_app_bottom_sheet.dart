import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

showAppBottomSheet({required BuildContext context, required Widget widget}) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    enableDrag: true,
    isScrollControlled: true,
    useRootNavigator: true,
    useSafeArea: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius16),
    builder: (context) => widget,
  );
}
