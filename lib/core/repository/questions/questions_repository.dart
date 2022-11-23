import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habilita_enem/core/models/question_model.dart';
import 'package:habilita_enem/core/repository/questions/questions_repository_interface.dart';

class QuestionsRepository implements IQuestionsRepository {
  final FirebaseFirestore _firestore;
  QuestionsRepository(this._firestore);

  @override
  Future<List<QuestionModel>>? getSubjectQuestions({required String id}) async {
    List<QuestionModel> questions = [];

    final result = await _firestore.collection('questions').doc(id).get();

    List snapshotQuestions = result.data()!['questions'] as List;

    for (var i in snapshotQuestions) {
      questions.add(QuestionModel.fromMap(i));
    }

    return questions;
  }

  @override
  Future<List<QuestionModel>>? getAllQuestions() async {
    List<QuestionModel> questions = [];

    QuerySnapshot result = await _firestore.collection('questions').get();

    List snapshotQuestions = result.docs.map((e) => e.data()).toList();

    for (var i in snapshotQuestions) {
      for (var j in i['questions']) {
        questions.add(QuestionModel.fromMap(j));
      }
    }

    return questions;
  }
}
