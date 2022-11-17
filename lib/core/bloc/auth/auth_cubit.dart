import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habilita_enem/core/repository/auth/auth_repository_interface.dart';
import 'package:habilita_enem/core/models/auth_model.dart';
import 'package:rxdart/rxdart.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;

  final _firebaseAuth = FirebaseAuth.instance;
  final userDetails = BehaviorSubject<AuthModel>();
  var userDetailLoading = false;

  AuthCubit(this._authRepository) : super(const AuthState()) {
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

      emit(state.copyWith(
        authModel: AuthModel(id: firebaseUser.uid),
        status: AuthStatus.authenticated,
      ));
    } catch (_) {}

    userDetailLoading = false;
    _isLoggedStream.add(state.authModel.isNotEmpty);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      userDetails.sink.add(const AuthModel());
    } catch (_) {}
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

  AuthModel get currentUser => state.authModel;
}
