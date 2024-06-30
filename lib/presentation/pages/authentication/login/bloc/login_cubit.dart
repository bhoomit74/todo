import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repositories/auth_repository_impl.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/domain/usecases/login_usecase.dart';
import 'package:todo/domain/validators/validator.dart';
import 'package:todo/main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepository authRepository = AuthRepositoryImpl();
  String email = "";
  String password = "";
  String? emailError;
  String? passwordError;
  LoginCubit() : super(LoginInitial());

  void loginWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
      await getIt<LoginUseCase>().call(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void loginWithGoogle() async {
    try {} catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void onEmailChange(String email) {
    this.email = email;
    emailError = Validator.emailValidator(email);
    emit(LoginValidationChange());
  }

  void onPasswordChange(String password) {
    this.password = password;
    passwordError = Validator.passwordValidator(password);
    emit(LoginValidationChange());
  }

  bool get isLoginFormValid {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        emailError == null &&
        passwordError == null;
  }
}