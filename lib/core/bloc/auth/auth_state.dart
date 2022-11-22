part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel userModel;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.userModel = UserModel.empty,
  });

  bool get isLogged => status == AuthStatus.authenticated;

  @override
  List<Object> get props => [status, userModel];

  AuthState copyWith({
    AuthStatus? status,
    UserModel? userModel,
    String? orgId,
  }) {
    return AuthState(
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
    );
  }
}
