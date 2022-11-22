import 'package:habilita_enem/core/models/user_model.dart';

abstract class IUserRepository {
  Future<bool> setUser(UserModel userModel);

  Future<UserModel?> getUser({required String id});
}
