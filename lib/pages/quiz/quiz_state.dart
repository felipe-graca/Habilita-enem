part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final List<QuestionModel> allQuestions;
  const QuizState({this.allQuestions = const []});

  @override
  List<Object?> get props => [
        allQuestions,
      ];

  QuizState copyWith({
    final List<QuestionModel>? allQuestions,
  }) {
    return QuizState(
      allQuestions: allQuestions ?? this.allQuestions,
    );
  }
}
