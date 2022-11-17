import 'package:habilita_enem/core/models/auth_model.dart';

abstract class IAuthRepository {
  Future<String>? getUserToken();
  String? getUid();

  Future<void> signInFirebase(String email, String password);

  Future<bool> createFirebaseUser(AuthModel authModel);

  Future<void> resetPassword(String email);
}
