import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habilita_enem/core/models/history_model.dart';
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
  Future<bool> setQuestionHistory({
    required HistoryModel historyItem,
    required String subjectQuestion,
    required String userId,
  }) async {
    try {
      List<HistoryModel> currentHistory = [];

      var resultHistory = await _firestore
          .collection('users')
          .doc(userId)
          .collection('historyQuestions')
          .doc(subjectQuestion)
          .get();

      if (!resultHistory.exists) {
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('historyQuestions')
            .doc(subjectQuestion)
            .set({
          'questions': [historyItem.toMap()]
        });
      } else {
        List<Map<String, dynamic>> historyQuestions = [
          ...resultHistory.data()!['questions']
        ];

        for (var i in historyQuestions) {
          currentHistory.add(HistoryModel.fromMap(i));
        }
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('historyQuestions')
            .doc(subjectQuestion)
            .set({
          'questions': [
            ...currentHistory.map((e) => e.toMap()),
            historyItem.toMap()
          ]
        });
      }
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<List<HistoryModel>> getUserHistory({required String id}) async {
    List<HistoryModel> history = [];

    QuerySnapshot result = await _firestore
        .collection('users')
        .doc(id)
        .collection('historyQuestions')
        .get();

    List snapshotHistory = result.docs.map((e) => e.data()).toList();

    for (var i in snapshotHistory) {
      for (var j in i['questions']) {
        history.add(HistoryModel.fromMap(j));
      }
    }

    return history;
  }

  @override
  Future<UserModel?> getUser({required String id}) async {
    try {
      final result = await _firestore.collection('users').doc(id).get();
      return UserModel.fromMap(result.data()!);
    } catch (_) {}
    return null;
  }

  @override
  Future<bool> updateUserName({
    required String id,
    required String name,
  }) async {
    try {
      await _firestore.collection('users').doc(id).update({'name': name});
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> updateUserPoints({
    required String id,
    required int points,
  }) async {
    try {
      await _firestore.collection('users').doc(id).update({'points': points});
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<List<UserModel>> getAllUser() async {
    List<UserModel> users = [];

    QuerySnapshot result = await _firestore.collection('users').get();

    List snapshotHistory = result.docs.map((e) => e.data()).toList();

    for (var i in snapshotHistory) {
      users.add(UserModel.fromMap(i));
    }

    return users;
  }
}
