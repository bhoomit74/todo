import 'package:todo/domain/entities/user.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String email, String password) async {
    return await repository.loginWithEmailAndPassword(email, password);
  }
}
