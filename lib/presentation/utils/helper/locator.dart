import 'package:get_it/get_it.dart';
import 'package:todo/data/repositories/auth_repository_impl.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/domain/usecases/authentication/login_usecase.dart';
import 'package:todo/presentation/pages/authentication/login/bloc/login_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(locator<AuthRepository>()));

  locator.registerLazySingleton<LoginCubit>(() => LoginCubit());
}
