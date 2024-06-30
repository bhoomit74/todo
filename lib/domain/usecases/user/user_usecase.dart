import 'package:todo/domain/entities/user.dart';
import 'package:todo/domain/repositories/user_repository.dart';

class UserUsecase {
  final UserRepository repository;

  UserUsecase(this.repository);

  Future<User> call() async {
    return await repository.fetchCurrentUser();
  }
}
