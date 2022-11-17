import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/models/auth_model.dart';
import 'package:habilita_enem/core/models/form/confirmed_password_validator.dart';
import 'package:habilita_enem/core/models/form/email_validator.dart';
import 'package:habilita_enem/core/models/form/password_validator.dart';
import 'package:habilita_enem/core/repository/auth/auth_repository_interface.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IAuthRepository _authRepository;
  final AuthCubit _authCubit;
  RegisterCubit(
    this._authRepository,
    this._authCubit,
  ) : super(const RegisterState());

  void emailChanged(String value) {
    final email = EmailValidator.dirty(value);
    emit(state.copyWith(email: email, status: Formz.validate([email])));
  }

  void passwordChanged(String value) {
    final password = PasswordValidator.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPasswordValidator.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      status: Formz.validate([confirmedPassword]),
    ));
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final authModel = AuthModel(
        email: state.email.value,
        password: state.password.value,
      );

      await _authRepository.createFirebaseUser(authModel);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  bool validateForm() {
    final email = EmailValidator.dirty(state.email.value);
    final password = PasswordValidator.dirty(state.password.value);
    final confirmedPassword = ConfirmedPasswordValidator.dirty(
      password: state.password.value,
      value: state.confirmedPassword.value,
    );
    emit(state.copyWith(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: Formz.validate(
        [email, password, confirmedPassword],
      ),
      wasSubmitted: true,
    ));

    return state.status.isValid;
  }

  bool get isLooged => _authCubit.state.isLogged;

  bool get formIsValid => state.status.isValid;

  bool get submissionSuccess => state.status == FormzStatus.submissionSuccess;

  bool get isLoading => state.status == FormzStatus.submissionInProgress;

  String get errorMessage => state.errorMessage;
}
