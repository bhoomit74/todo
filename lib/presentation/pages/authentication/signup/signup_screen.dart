import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/authentication/signup/bloc/signup_cubit.dart';
import 'package:todo/presentation/pages/dashboard/dashboard.dart';
import 'package:todo/presentation/utils/helper/helpers.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

import 'signup_page.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          LoadingDialog.dismiss(context);
          navigateToDashboard(context);
        } else if (state is SignupLoading) {
          LoadingDialog.show(context);
        } else if (state is SignupError) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.error(context, state.message);
        }
      },
      bloc: locator<SignUpCubit>(),
      builder: (context, state) {
        return const SignUpPage();
      },
    );
  }

  navigateToDashboard(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Dashboard()));
  }
}
