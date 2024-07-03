import 'package:flutter_test/flutter_test.dart';
import 'package:todo/domain/validators/validator.dart';

void main() {
  group('Validator', () {
    // Name Validator Tests
    test('nameValidator returns "Name required" if the name is empty', () {
      expect(Validator.nameValidator(''), "Name required");
    });

    test('nameValidator returns null if the name is not empty', () {
      expect(Validator.nameValidator('Name'), null);
    });

    // Email Validator Tests
    test('emailValidator returns "Email required" if the email is empty', () {
      expect(Validator.emailValidator(''), "Email required");
    });

    test(
        'emailValidator returns "Enter valid email" if the email format is invalid',
        () {
      expect(Validator.emailValidator('invalidEmail'), "Enter valid email");
    });

    test('emailValidator returns null if the email format is valid', () {
      expect(Validator.emailValidator('test@example.com'), null);
    });

    // Password Validator Tests
    test(
        'passwordValidator returns "Password required" if the password is empty',
        () {
      expect(Validator.passwordValidator(''), "Password required");
    });

    test(
        'passwordValidator returns "Password must be at least 6 characters long." if the password length is less than 6',
        () {
      expect(Validator.passwordValidator('abc'),
          "Password must be at least 6 characters long.");
    });

    test(
        'passwordValidator returns "Password must contain at least one uppercase letter." if the password does not contain an uppercase letter',
        () {
      expect(Validator.passwordValidator('abcdef'),
          "Password must contain at least one uppercase letter.");
    });

    test(
        'passwordValidator returns null if the password meets all requirements',
        () {
      expect(Validator.passwordValidator('Abcdef1'), null);
    });
  });
}
