import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/models/history_model.dart';
import 'package:habilita_enem/core/models/question_model.dart';
import 'package:habilita_enem/core/repository/questions/questions_repository_interface.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final IQuestionsRepository _questionsRepository;
  final IUserRepository _userRepository;
  QuizCubit(
    this._questionsRepository,
    this._userRepository,
  ) : super(const QuizState());

  final pageController = PageController(initialPage: 0);

  final _authCubit = GetIt.I.get<AuthCubit>();

  init() async {
    final result = await _questionsRepository.getAllQuestions();
    emit(QuizState(questions: result!));
  }

  void updateSubjectQuestion({
    required String value,
    required String title,
  }) async {
    List<QuestionModel> result = [];
    if (value == 'todos') {
      result = await _questionsRepository.getAllQuestions() ?? [];
    } else {
      result = await _questionsRepository.getSubjectQuestions(id: value) ?? [];
    }

    emit(
      state.copyWith(
        title: title,
        questions: result,
        result: () => null,
        userResult: () => null,
        currentQuestion: () => QuestionModel(
          text: result.first.text,
          aResult: result.first.aResult,
          bResult: result.first.bResult,
          cResult: result.first.cResult,
          dResult: result.first.dResult,
          eResult: result.first.eResult,
          result: result.first.result,
        ),
      ),
    );
  }

  void nextQuestion(int questionIndex) {
    pageController.jumpToPage(questionIndex);
    emit(
      state.copyWith(
        result: () => null,
        userResult: () => null,
        currentQuestion: () => QuestionModel(
          text: state.questions[questionIndex].text,
          aResult: state.questions[questionIndex].aResult,
          bResult: state.questions[questionIndex].bResult,
          cResult: state.questions[questionIndex].cResult,
          dResult: state.questions[questionIndex].dResult,
          eResult: state.questions[questionIndex].eResult,
          result: state.questions[questionIndex].result,
        ),
      ),
    );
  }

  void returnQuestion(int questionIndex) {
    pageController.jumpToPage(questionIndex);
    emit(
      state.copyWith(
        result: () => null,
        userResult: () => null,
        currentQuestion: () => QuestionModel(
          text: state.questions[questionIndex].text,
          aResult: state.questions[questionIndex].aResult,
          bResult: state.questions[questionIndex].bResult,
          cResult: state.questions[questionIndex].cResult,
          dResult: state.questions[questionIndex].dResult,
          eResult: state.questions[questionIndex].eResult,
          result: state.questions[questionIndex].result,
        ),
      ),
    );
  }

  Future<void> checkCurrectQuestion({
    required String resultQuestion,
    required String subjectQuestion,
    required String userResult,
  }) async {
    emit(state.copyWith(
      result: () => resultQuestion,
      userResult: () => userResult,
    ));

    final questionNumber = state.questions.indexOf(state.currentQuestion!) + 1;
    final title = state.title ?? 'error';

    await _userRepository.setQuestionHistory(
      historyItem: HistoryModel(
          question: state.currentQuestion!,
          userRsult: state.userResult!,
          questionNumber: questionNumber,
          subject: title),
      subjectQuestion: title.toLowerCase(),
      userId: _authCubit.currentUser.id,
    );

    if (state.result == state.userResult) {
      final insertPoints = await _userRepository.updateUserPoints(
        id: _authCubit.currentUser.id,
        points: _authCubit.currentUser.points + 10,
      );

      if (insertPoints) {
        _authCubit.updateCurrentUserPoints(_authCubit.currentUser.points + 10);
      }
    }
  }

  void clearSubjectQuestion() {
    emit(state.copyWith(
      currentQuestion: () => null,
      userResult: () => null,
      result: () => null,
    ));
  }
}
