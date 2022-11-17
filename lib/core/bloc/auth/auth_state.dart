part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthModel authModel;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.authModel = AuthModel.empty,
  });

  bool get isLogged => status == AuthStatus.authenticated;

  @override
  List<Object> get props => [status, authModel];

  AuthState copyWith({
    AuthStatus? status,
    AuthModel? authModel,
    String? orgId,
  }) {
    return AuthState(
      status: status ?? this.status,
      authModel: authModel ?? this.authModel,
    );
  }
}
