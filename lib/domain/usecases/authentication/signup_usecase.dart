import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/domain/repositories/user_repository.dart';

class SignupUseCase {
  AuthRepository repository;
  UserRepository userRepository;

  SignupUseCase(this.repository, this.userRepository);

  Future<void> call(
      {required String name,
      required String email,
      required String password}) async {
    await repository.signUpWithEmailAndPassword(email, password);
    await userRepository.updateName(name);
  }
}
