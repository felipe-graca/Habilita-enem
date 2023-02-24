part of 'ranking_cubit.dart';

class RankingState extends Equatable {
  final UserModel first;
  final UserModel second;
  final UserModel third;
  final List<UserModel> users;

  const RankingState({
    this.first = UserModel.empty,
    this.second = UserModel.empty,
    this.third = UserModel.empty,
    this.users = const [],
  });

  @override
  List<Object?> get props => [
        first,
        second,
        third,
        users,
      ];

  RankingState copyWith({
    final UserModel? first,
    final UserModel? second,
    final UserModel? third,
    final List<UserModel>? users,
  }) {
    return RankingState(
      first: first ?? this.first,
      second: second ?? this.second,
      third: third ?? this.third,
      users: users ?? this.users,
    );
  }
}
