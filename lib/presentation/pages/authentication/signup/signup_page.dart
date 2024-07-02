import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/authentication/signup/bloc/signup_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit = locator<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignupState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is ValidationChange,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: AppConstants.padding32,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.signup, style: AppTextStyle.h2()),
                      AppConstants.gap8,
                      Text(AppStrings.signupWelcomeMessage,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.body(color: AppColors.grey)),
                      AppConstants.gap32,
                      AppTextField(
                        hint: AppStrings.yourName,
                        error: cubit.nameError,
                        onChanged: cubit.onNameChange,
                        focusedBorderColor: AppColors.primary,
                        textInputType: TextInputType.name,
                        prefixIcon:
                            const Icon(Icons.person, color: AppColors.primary),
                      ),
                      AppConstants.gap8,
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
                          label: AppStrings.signup,
                          onPressed: cubit.isSignUpFormValid
                              ? cubit.signUpWithEmailAndPassword
                              : null),
                      AppConstants.gap32,
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text("Back to Login",
                              style: AppTextStyle.bodyBold(
                                  color: AppColors.primary))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
