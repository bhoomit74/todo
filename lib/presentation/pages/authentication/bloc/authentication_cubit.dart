import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/validators/validator.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  String email = "";
  String password = "";
  String? emailError;
  String? passwordError;
  AuthenticationCubit() : super(AuthenticationInitial());

  void loginWithEmailAndPassword() {
    //TODO: Add firebase authentication with email and password
  }

  void loginWithGoogle() {
    //TODO: Add firebase authentication with google
  }

  void onEmailChange(String email) {
    this.email = email;
    emailError = Validator.emailValidator(email);
    emit(ValidationErrorChange());
  }

  void onPasswordChange(String password) {
    this.password = password;
    passwordError = Validator.passwordValidator(password);
    emit(ValidationErrorChange());
  }

  bool get isLoginFormValid {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        emailError == null &&
        passwordError == null;
  }
}
