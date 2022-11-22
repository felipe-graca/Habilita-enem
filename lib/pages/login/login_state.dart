part of 'login_cubit.dart';

class LoginState extends Equatable {
  final EmailValidator email;
  final PasswordValidator password;
  final FormzStatus status;
  final String errorMessage;
  final bool wasSubmitted;

  const LoginState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
    this.wasSubmitted = false,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        errorMessage,
        wasSubmitted,
      ];

  LoginState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    FormzStatus? status,
    String? errorMessage,
    bool? wasSubmitted,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      wasSubmitted: wasSubmitted ?? this.wasSubmitted,
    );
  }
}
