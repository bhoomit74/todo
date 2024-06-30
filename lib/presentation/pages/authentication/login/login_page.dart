import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/authentication/login/bloc/login_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = locator<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is LoginValidationChange,
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
                    error: cubit.emailError,
                    onChanged: cubit.onEmailChange,
                    focusedBorderColor: AppColors.primary,
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_rounded,
                        color: AppColors.primary),
                  ),
                  AppConstants.gap8,
                  AppTextField(
                    hint: AppStrings.password,
                    error: cubit.passwordError,
                    focusedBorderColor: AppColors.primary,
                    obscureText: true,
                    onChanged: cubit.onPasswordChange,
                    textInputType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock_rounded,
                        color: AppColors.primary),
                  ),
                  AppConstants.gap32,
                  AppButton(
                      label: AppStrings.login,
                      onPressed: cubit.isLoginFormValid
                          ? cubit.loginWithEmailAndPassword
                          : null),
                  AppConstants.gap32,
                  const Divider(color: AppColors.lightGrey),
                  AppConstants.gap32,
                  AppButton(
                      label: AppStrings.signInWithGoogle,
                      onPressed: cubit.loginWithGoogle,
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
}
