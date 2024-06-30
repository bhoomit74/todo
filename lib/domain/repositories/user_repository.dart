import 'package:todo/domain/entities/user.dart';

abstract class UserRepository {
  User fetchCurrentUser();
  Future<void> updateName(String name);
}
