import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/pages/quiz/quiz_cubit.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizCubit = GetIt.I.get<QuizCubit>();

  @override
  void initState() {
    quizCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      bloc: quizCubit,
      builder: (context, state) {
        return Center(
          child: Text(state.allQuestions.toString()),
        );
      },
    );
  }
}
