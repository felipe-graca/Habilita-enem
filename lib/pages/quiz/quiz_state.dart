part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final List<QuestionModel> questions;
  final QuestionModel? currentQuestion;
  final String? title;
  final String? result;
  final String? userResult;

  const QuizState({
    this.questions = const [],
    this.title,
    this.currentQuestion,
    this.result,
    this.userResult,
  });

  @override
  List<Object?> get props => [
        questions,
        title,
        currentQuestion,
        result,
        userResult,
      ];

  QuizState copyWith(
      {final List<QuestionModel>? questions,
      final String? title,
      final QuestionModel? Function()? currentQuestion,
      final String? Function()? result,
      final String? Function()? userResult}) {
    return QuizState(
      questions: questions ?? this.questions,
      title: title ?? this.title,
      currentQuestion:
          currentQuestion != null ? currentQuestion() : this.currentQuestion,
      result: result != null ? result() : this.result,
      userResult: userResult != null ? userResult() : this.userResult,
    );
  }
}
