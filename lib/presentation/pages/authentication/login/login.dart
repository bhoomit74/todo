import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/authentication/bloc/authentication_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/widgets/app_button.dart';
import 'package:todo/presentation/widgets/app_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthenticationCubit cubit = AuthenticationCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      bloc: cubit,
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
                    onChanged: (email) => cubit.onEmailChange(email),
                    error: cubit.emailError,
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
                    error: cubit.passwordError,
                    focusedBorderColor: AppColors.primary,
                    obscureText: true,
                    onChanged: (password) => cubit.onPasswordChange(password),
                    textInputType: TextInputType.visiblePassword,
                    prefixIcon: const Padding(
                      padding: AppConstants.paddingH16,
                      child: Icon(Icons.lock_rounded, color: AppColors.primary),
                    ),
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
