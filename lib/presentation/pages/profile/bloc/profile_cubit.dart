import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/entities/user.dart';
import 'package:todo/domain/usecases/authentication/logout_usecase.dart';
import 'package:todo/domain/usecases/user/user_usecase.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  User user = User();
  ProfileCubit() : super(ProfileInitial()) {
    loadUser();
  }

  loadUser() async {
    emit(ProfileLoading());
    try {
      user = await locator<UserUsecase>().call();
      debugPrint("User: ${user.name} ${user.profileUrl} ${user.email}");
      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  logout() async {
    emit(ProfileLoading());
    try {
      await locator<LogoutUseCase>().logout();
      emit(ProfileLogout());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
