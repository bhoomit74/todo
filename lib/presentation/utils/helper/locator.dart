import 'package:get_it/get_it.dart';
import 'package:todo/data/repositories/auth_repository_impl.dart';
import 'package:todo/data/repositories/user_repository_impl.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/domain/repositories/user_repository.dart';
import 'package:todo/domain/usecases/authentication/login_usecase.dart';
import 'package:todo/domain/usecases/authentication/logout_usecase.dart';
import 'package:todo/domain/usecases/user/user_usecase.dart';
import 'package:todo/presentation/pages/authentication/login/bloc/login_cubit.dart';
import 'package:todo/presentation/pages/profile/bloc/profile_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  //Authentication
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(locator<AuthRepository>()));

  locator.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(locator<AuthRepository>()));

  locator.registerLazySingleton<LoginCubit>(() => LoginCubit());

  //User
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  locator.registerLazySingleton<UserUsecase>(
      () => UserUsecase(locator<UserRepository>()));

  locator.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
}
