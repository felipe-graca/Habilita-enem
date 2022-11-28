part of 'ranking_cubit.dart';

class RankingState extends Equatable {
  final UserModel first;
  final UserModel second;
  final UserModel third;
  const RankingState({
    this.first = UserModel.empty,
    this.second = UserModel.empty,
    this.third = UserModel.empty,
  });

  @override
  List<Object?> get props => [
        first,
        second,
        third,
      ];

  RankingState copyWith({
    final UserModel? first,
    final UserModel? second,
    final UserModel? third,
  }) {
    return RankingState(
      first: first ?? this.first,
      second: second ?? this.second,
      third: third ?? this.third,
    );
  }
}
