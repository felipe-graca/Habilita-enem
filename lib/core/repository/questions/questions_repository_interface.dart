import 'package:habilita_enem/core/models/question_model.dart';

abstract class IQuestionsRepository {
  Future<List<QuestionModel>>? getSubjectQuestions({required String id});
  Future<List<QuestionModel>>? getAllQuestions();
}
