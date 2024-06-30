import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/usecases/authentication/logout_usecase.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

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
