import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habilita_enem/core/models/user_model.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  final IUserRepository _userRepository;
  RankingCubit(this._userRepository) : super(const RankingState());

  Future<void> init() async {
    emit(const RankingState());
    final users = await _userRepository.getAllUser();

    List<int> userPoints = [];

    for (var i in users) {
      userPoints.add(i.points);
    }

    final frist = users.firstWhere(
      (element) =>
          element.points ==
          userPoints.reduce((curr, next) => curr > next ? curr : next),
    );

    userPoints.removeWhere((element) => element == frist.points);

    final second = users.firstWhere(
      (element) =>
          element.points ==
          userPoints.reduce((curr, next) => curr > next ? curr : next),
    );

    userPoints.removeWhere((element) => element == second.points);

    final third = users.firstWhere(
      (element) =>
          element.points ==
          userPoints.reduce((curr, next) => curr > next ? curr : next),
    );

    userPoints.removeWhere((element) => element == third.points);

    emit(state.copyWith(
      first: frist,
      second: second,
      third: third,
    ));
  }
}
