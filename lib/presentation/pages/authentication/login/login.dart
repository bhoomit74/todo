import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/main.dart';
import 'package:todo/presentation/pages/authentication/login/bloc/login_cubit.dart';
import 'package:todo/presentation/pages/dashboard/dashboard.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/helpers.dart';
import 'package:todo/presentation/widgets/app_button.dart';
import 'package:todo/presentation/widgets/app_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          LoadingDialog.dismiss(context);
          navigateToDashboard(context);
        } else if (state is LoginLoading) {
          LoadingDialog.show(context);
        } else if (state is LoginError) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.error(context, state.message);
        }
      },
      bloc: getIt<LoginCubit>(),
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: AppConstants.padding32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.login, style: AppTextStyle.h2()),
                  AppConstants.gap8,
                  Text(AppStrings.welcomeBackEnterDetails,
                      style: AppTextStyle.body(color: AppColors.grey)),
                  AppConstants.gap32,
                  AppTextField(
                    hint: AppStrings.email,
                    error: getIt<LoginCubit>().emailError,
                    onChanged: getIt<LoginCubit>().onEmailChange,
                    focusedBorderColor: AppColors.primary,
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: const Padding(
                      padding: AppConstants.paddingH16,
                      child:
                          Icon(Icons.email_rounded, color: AppColors.primary),
                    ),
                  ),
                  AppConstants.gap8,
                  AppTextField(
                    hint: AppStrings.password,
                    error: getIt<LoginCubit>().passwordError,
                    focusedBorderColor: AppColors.primary,
                    obscureText: true,
                    onChanged: getIt<LoginCubit>().onPasswordChange,
                    textInputType: TextInputType.visiblePassword,
                    prefixIcon: const Padding(
                      padding: AppConstants.paddingH16,
                      child: Icon(Icons.lock_rounded, color: AppColors.primary),
                    ),
                  ),
                  AppConstants.gap32,
                  AppButton(
                      label: AppStrings.login,
                      onPressed: getIt<LoginCubit>().isLoginFormValid
                          ? getIt<LoginCubit>().loginWithEmailAndPassword
                          : null),
                  AppConstants.gap32,
                  const Divider(color: AppColors.lightGrey),
                  AppConstants.gap32,
                  AppButton(
                      label: AppStrings.signInWithGoogle,
                      onPressed: getIt<LoginCubit>().loginWithGoogle,
                      bgColor: AppColors.white,
                      textColor: AppColors.black),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  navigateToDashboard(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Dashboard()));
  }
}
