import 'package:habilita_enem/core/models/history_model.dart';
import 'package:habilita_enem/core/models/user_model.dart';

abstract class IUserRepository {
  Future<bool> setUser(UserModel userModel);

  Future<UserModel?> getUser({required String id});

  Future<bool> setQuestionHistory({
    required HistoryModel historyItem,
    required String subjectQuestion,
    required String userId,
  });

  Future<List<HistoryModel>> getUserHistory({required String id});

  Future<bool> updateUserName({required String id, required String name});

  Future<bool> updateUserPoints({required String id, required int points});

  Future<List<UserModel>> getAllUser();
}
