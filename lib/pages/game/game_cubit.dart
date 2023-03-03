import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habilita_enem/core/repository/news/news_repository_interface.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final INewsRepository newsRepository;

  GameCubit(this.newsRepository) : super(const GameState());

  void init() async {
    await newsRepository.getNews();
  }
}
