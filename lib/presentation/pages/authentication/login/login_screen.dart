import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/authentication/login/bloc/login_cubit.dart';
import 'package:todo/presentation/pages/dashboard/dashboard.dart';
import 'package:todo/presentation/utils/helper/helpers.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

import 'login_page.dart';

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
      bloc: locator<LoginCubit>(),
      builder: (context, state) {
        return const LoginPage();
      },
    );
  }

  navigateToDashboard(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const Dashboard()));
  }
}
