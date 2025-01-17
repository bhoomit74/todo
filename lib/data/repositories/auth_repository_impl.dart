import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:todo/data/mappers/user_mapper.dart';
import 'package:todo/data/models/user_model.dart';
import 'package:todo/domain/entities/user.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        UserModel userModel = UserModel(
            id: credential.user?.uid ?? "",
            name: credential.user?.displayName,
            email: credential.user?.email ?? "",
            profileUrl: credential.user?.photoURL,
            isEmailVerified: credential.user?.emailVerified ?? false);

        return UserMapper.toEntity(userModel);
      }
      throw "User not found";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw "Incorrect username or password. If you don't have an account, please sign up.";
      }
      throw e.toString();
    }
  }

  @override
  Future<void> loginWithGoogle() async {}

  @override
  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for this email.';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
