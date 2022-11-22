part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final EmailValidator email;
  final TextValidator name;
  final PasswordValidator password;
  final ConfirmedPasswordValidator confirmedPassword;
  final FormzStatus status;
  final String errorMessage;
  final bool wasSubmitted;

  const RegisterState({
    this.email = const EmailValidator.pure(),
    this.name = const TextValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.confirmedPassword = const ConfirmedPasswordValidator.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
    this.wasSubmitted = false,
  });

  @override
  List<Object?> get props => [
        email,
        name,
        password,
        confirmedPassword,
        status,
        errorMessage,
        wasSubmitted,
      ];

  RegisterState copyWith({
    EmailValidator? email,
    TextValidator? name,
    PasswordValidator? password,
    ConfirmedPasswordValidator? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
    bool? wasSubmitted,
  }) {
    return RegisterState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      wasSubmitted: wasSubmitted ?? this.wasSubmitted,
    );
  }
}
