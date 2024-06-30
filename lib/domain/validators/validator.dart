import 'package:todo/domain/validators/regex.dart';

class Validator {
  static String? nameValidator(String name) {
    if (name.isEmpty) {
      return "Name required";
    }
    return null;
  }

  static String? emailValidator(String email) {
    if (email.isEmpty) {
      return "Email required";
    }
    if (!AppRegExp.emailRegExp.hasMatch(email)) {
      return "Enter valid email";
    }
    return null;
  }

  static String? passwordValidator(String password) {
    if (password.isEmpty) {
      return "Password required";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long.";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain at least one uppercase letter.";
    }
    return null;
  }
}
