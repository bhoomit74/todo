import 'package:todo/data/models/user_model.dart';
import 'package:todo/domain/entities/user.dart';

class UserMapper {
  static User toEntity(UserModel userModel) {
    return User(
      id: userModel.id,
      email: userModel.email,
      name: userModel.name ?? "Taskmaster!",
      profileUrl: userModel.profileUrl,
      isEmailVerified: userModel.isEmailVerified,
    );
  }
}
