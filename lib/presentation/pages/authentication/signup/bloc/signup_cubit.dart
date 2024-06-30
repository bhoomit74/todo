import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/usecases/authentication/signup_usecase.dart';
import 'package:todo/domain/validators/validator.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  String name = "";
  String email = "";
  String password = "";
  String? nameError;
  String? emailError;
  String? passwordError;
  SignUpCubit() : super(SignupInitial());

  void signUpWithEmailAndPassword() async {
    emit(SignupLoading());
    try {
      await locator<SignupUseCase>()
          .call(name: name, email: email, password: password);
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }

  void onNameChange(String name) {
    this.name = name;
    nameError = Validator.nameValidator(name);
    emit(ValidationChange());
  }

  void onEmailChange(String email) {
    this.email = email;
    emailError = Validator.emailValidator(email);
    emit(ValidationChange());
  }

  void onPasswordChange(String password) {
    this.password = password;
    passwordError = Validator.passwordValidator(password);
    emit(ValidationChange());
  }

  bool get isSignUpFormValid {
    return name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        nameError == null &&
        emailError == null &&
        passwordError == null;
  }
}
