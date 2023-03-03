part of 'game_cubit.dart';

class GameState extends Equatable {
  final bool inGame;
  const GameState({
    this.inGame = false,
  });

  @override
  List<Object?> get props => [];

  GameState copyWith({
    bool? inGame,
  }) {
    return GameState(
      inGame: inGame ?? this.inGame,
    );
  }
}
