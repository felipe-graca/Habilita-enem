import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/pages/game/components/game_questions_component.dart';
import 'package:habilita_enem/pages/game/components/game_subjects_component.dart';
import 'package:habilita_enem/pages/game/game_cubit.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final gameCubit = GetIt.I.get<GameCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: BlocBuilder<GameCubit, GameState>(
        bloc: gameCubit,
        builder: (context, state) {
          if (!state.inGame) {
            return const GameSubjectsComponent();
          }
          return const GameQuestionsComponent();
        },
      ),
    );
  }
}
