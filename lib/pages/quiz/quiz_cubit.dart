import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habilita_enem/core/models/question_model.dart';
import 'package:habilita_enem/core/repository/questions/questions_repository_interface.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final IQuestionsRepository _questionsRepository;
  QuizCubit(this._questionsRepository) : super(const QuizState());

  init() async {
    final result = await _questionsRepository.getAllQuestions();
    emit(state.copyWith(allQuestions: result));
  }
}
