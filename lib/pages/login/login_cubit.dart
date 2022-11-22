import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/models/auth_model.dart';
import 'package:habilita_enem/core/models/form/email_validator.dart';
import 'package:habilita_enem/core/models/form/password_validator.dart';
import 'package:habilita_enem/core/repository/auth/auth_repository_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthCubit _authCubit;
  final IAuthRepository _authRepository;
  LoginCubit(this._authCubit, this._authRepository) : super(const LoginState());

  void init() async {
    emit(const LoginState(wasSubmitted: false));
  }

  void emailChanged(String value) {
    final email = EmailValidator.dirty(value.toLowerCase());
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordValidator.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final email = EmailValidator.dirty(state.email.value);
      final password = PasswordValidator.dirty(state.password.value);

      final authModel = AuthModel(email: email.value, password: password.value);

      await _authRepository.signInFirebase(authModel);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  bool validateForm() {
    final email = EmailValidator.dirty(state.email.value.trim());
    final password = PasswordValidator.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        status: Formz.validate([email, password]),
        wasSubmitted: true,
      ),
    );
    return state.status.isValid;
  }

  bool get isLooged => _authCubit.state.isLogged;

  bool get formIsValid => state.status.isValid;

  bool get submissionSuccess => state.status == FormzStatus.submissionSuccess;

  bool get isLoading => state.status == FormzStatus.submissionInProgress;

  String get errorMessage => state.errorMessage;
}
