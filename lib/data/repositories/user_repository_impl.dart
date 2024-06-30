import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:todo/data/mappers/user_mapper.dart';
import 'package:todo/data/models/user_model.dart';
import 'package:todo/domain/entities/user.dart';
import 'package:todo/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> fetchCurrentUser() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      UserModel userModel = UserModel(
          id: user?.uid ?? "",
          name: user?.displayName,
          email: user?.email ?? "",
          profileUrl: user?.photoURL,
          isEmailVerified: user?.emailVerified ?? false);
      return UserMapper.toEntity(userModel);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> updateName(String name) async {
    try {
      FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    } catch (e) {
      throw e.toString();
    }
  }
}
