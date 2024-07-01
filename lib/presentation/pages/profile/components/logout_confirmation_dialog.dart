import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/profile/bloc/profile_cubit.dart';
import 'package:todo/presentation/styles/app_colors.dart';
import 'package:todo/presentation/styles/app_constants.dart';
import 'package:todo/presentation/styles/app_text_styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_button.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: AppColors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: AppConstants.borderRadius32,
              color: AppColors.white),
          padding: AppConstants.padding16,
          margin: AppConstants.padding16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_amber_rounded,
                  size: 64, color: AppColors.orange),
              AppConstants.gap8,
              Text("Logout", style: AppTextStyle.h2()),
              AppConstants.gap4,
              Text("Are you sure you want to logout?",
                  style: AppTextStyle.body(color: AppColors.black70)),
              AppConstants.gap32,
              AppButton(
                  label: "Logout",
                  bgColor: AppColors.orange,
                  onPressed: () {
                    Navigator.pop(context);
                    locator<ProfileCubit>().logout();
                  }),
              AppConstants.gap8,
              AppButton(
                  label: "Cancel",
                  bgColor: AppColors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  static show(BuildContext context) {
    showDialog(
        context: context, builder: (_) => const LogoutConfirmationDialog());
  }
}
