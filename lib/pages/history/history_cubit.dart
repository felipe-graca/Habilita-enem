import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/models/history_model.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';

import '../../core/bloc/auth/auth_cubit.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final IUserRepository _userRepository;
  HistoryCubit(this._userRepository) : super(const HistoryState());

  final _authCubit = GetIt.I.get<AuthCubit>();

  void init() async {
    final result =
        await _userRepository.getUserHistory(id: _authCubit.currentUser.id);

    emit(state.copyWith(historyQuestions: [...result]));
  }
}
