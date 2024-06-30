import 'package:todo/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<bool> logout() async {
    return await repository.logout();
  }
}
