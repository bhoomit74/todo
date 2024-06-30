import 'package:todo/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> fetchCurrentUser();
  Future<void> updateName(String name);
}
