import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/components/custom_snackbar.dart';
import 'package:habilita_enem/core/helpers/app_ui.dart';
import 'package:habilita_enem/core/models/user_model.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'package:habilita_enem/pages/register/register_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IUserRepository _userRepository;

  final _firebaseAuth = FirebaseAuth.instance;
  var userDetailLoading = false;

  AuthCubit(this._userRepository) : super(const AuthState()) {
    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      _onUserChanged();
    });
  }

  final _isLoggedStream = StreamController<bool>.broadcast();

  late final isLogged = _isLoggedStream.stream;

  void startListenAuthChanges() {
    _firebaseAuth.userChanges().listen((event) {
      _onUserChanged();
    });
  }

  dispose() {
    _isLoggedStream.close();
  }

  Future<void> _onUserChanged() async {
    if (userDetailLoading) {
      return;
    }

    userDetailLoading = true;
    final firebaseUser = _firebaseAuth.currentUser;

    try {
      if (firebaseUser == null) {
        emit(const AuthState(status: AuthStatus.unauthenticated));

        _isLoggedStream.add(false);
        userDetailLoading = false;
        return;
      }

      final user = await _userRepository.getUser(id: firebaseUser.uid);

      if (user != null) {
        emit(state.copyWith(
          userModel: UserModel(
            id: user.id,
            email: user.email,
            points: user.points,
            base64Image: user.base64Image,
            name: user.name,
          ),
          status: AuthStatus.authenticated,
        ));
      } else {
        final newUser = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email!,
          points: 0,
          base64Image: '',
          name: GetIt.I.get<RegisterCubit>().state.name.value,
        );
        emit(state.copyWith(
          userModel: newUser,
          status: AuthStatus.authenticated,
        ));
        await _userRepository.setUser(newUser);

        final user = await _userRepository.getUser(id: newUser.id);

        if (user != null) {
          emit(state.copyWith(
            userModel: user,
            status: AuthStatus.authenticated,
          ));
        }
      }
    } catch (_) {}

    userDetailLoading = false;
    _isLoggedStream.add(state.userModel.isNotEmpty);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      AppUI.snackbarsToDisplayWhenStart.add(SnackbarToDisplayModel(
        text: 'Volte sempre!',
        status: CustomSnackbarStatus.success,
        page: AppRouter.login,
      ));
    } catch (_) {}
  }

  void updateCurrentUserName(String name) {
    emit(state.copyWith(userModel: state.userModel.copyWith(name: name)));
  }

  void updateCurrentUserPoints(int points) {
    emit(state.copyWith(userModel: state.userModel.copyWith(points: points)));
  }

  Future<String?> getToken() async {
    late final String? token;
    try {
      token = await _firebaseAuth.currentUser?.getIdToken(true);
    } catch (e) {
      token = await _firebaseAuth.currentUser?.getIdToken(false);
    }
    return token;
  }

  UserModel get currentUser => state.userModel;
}
