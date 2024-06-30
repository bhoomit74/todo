import 'package:todo/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> loginWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> loginWithGoogle();
  Future<bool> logout();
}
