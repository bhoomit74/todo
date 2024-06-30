import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/entities/user.dart';
import 'package:todo/domain/usecases/user/user_usecase.dart';
import 'package:todo/presentation/pages/authentication/login/login_screen.dart';
import 'package:todo/presentation/pages/dashboard/components/profile_picture.dart';
import 'package:todo/presentation/pages/profile/bloc/profile_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/helpers.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          LoadingDialog.show(context);
        } else if (state is ProfileError) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.error(context, state.message);
        } else if (state is ProfileLogout) {
          LoadingDialog.dismiss(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Login()),
              (route) => true);
        } else if (state is ProfileSuccess) {
          LoadingDialog.dismiss(context);
        }
      },
      bloc: locator<ProfileCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Profile", style: AppTextStyle.h3()),
            surfaceTintColor: AppColors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: AppConstants.padding32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfilePicture(
                    profileUrl: locator<User>().profileUrl,
                    size: 120,
                  ),
                  AppConstants.gap20,
                  Text(locator<UserUsecase>().getUser().name,
                      style: AppTextStyle.h4()),
                  AppConstants.gap32,
                  AppButton(
                      label: "Logout",
                      onPressed: locator<ProfileCubit>().logout)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
