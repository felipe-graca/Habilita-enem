import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habilita_enem/core/models/user_model.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  @override
  Future<bool> setUser(UserModel userModel) async {
    try {
      await _firestore.collection('users').doc(userModel.id).set(
            userModel.toMap(),
          );
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<UserModel?> getUser({required String id}) async {
    try {
      final result = await _firestore.collection('users').doc(id).get();
      return UserModel.fromMap(result.data()!);
    } catch (_) {}
    return null;
  }
}
