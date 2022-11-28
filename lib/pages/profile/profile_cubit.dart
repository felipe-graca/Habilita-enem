import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/models/form/text_validator.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IUserRepository _userRepository;
  ProfileCubit(this._userRepository) : super(const ProfileState());

  final _authCubit = GetIt.I.get<AuthCubit>();

  void init() async {
    emit(ProfileState(
      base64Image:
          TextValidator.dirty(value: _authCubit.currentUser.base64Image),
      name: TextValidator.dirty(value: _authCubit.currentUser.name),
      email: TextValidator.dirty(value: _authCubit.currentUser.email),
    ));
  }

  void nameChanged(String value) {
    final name = TextValidator.dirty(value: value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([name]),
      ),
    );
  }

  Future<bool> submit() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      await _userRepository.updateUserName(
        id: _authCubit.currentUser.id,
        name: state.name.value,
      );

      _authCubit.updateCurrentUserName(state.name.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return true;
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
    return false;
  }

  bool validateForm() {
    final name = TextValidator.dirty(value: state.name.value);

    emit(state.copyWith(
      name: name,
      status: Formz.validate([name]),
      wasSubmitted: true,
    ));

    return state.status.isValid;
  }

  bool get submissionSuccess => state.status == FormzStatus.submissionSuccess;

  bool get isLoading => state.status == FormzStatus.submissionInProgress;

  String get errorMessage => state.errorMessage;
}
