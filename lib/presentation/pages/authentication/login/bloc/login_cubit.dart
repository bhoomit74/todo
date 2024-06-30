import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/usecases/authentication/login_usecase.dart';
import 'package:todo/domain/validators/validator.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String email = "";
  String password = "";
  String? emailError;
  String? passwordError;
  LoginCubit() : super(LoginInitial());

  void loginWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
      await locator<LoginUseCase>().call(email, password);
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
