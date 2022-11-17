import 'package:firebase_auth/firebase_auth.dart';
import 'package:habilita_enem/core/models/auth_model.dart';
import 'package:habilita_enem/core/repository/auth/auth_repository_interface.dart';

final _firebaseAuth = FirebaseAuth.instance;

class AuthRepository implements IAuthRepository {
  AuthRepository();

  @override
  Future<String>? getUserToken() {
    return FirebaseAuth.instance.currentUser?.getIdToken();
  }

  @override
  String? getUid() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  @override
  Future<void> signInFirebase(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e, _) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<bool> createFirebaseUser(AuthModel authModel) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, _) {
      throw ResetPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw ResetPasswordFailure();
    }
  }
}

class HealablesException implements Exception {
  final String message =
      'A error occurred, Please check your network and try again.';
}

class ResetPasswordFailure implements HealablesException {
  @override
  final String message;

  ResetPasswordFailure([
    this.message = 'A error occurred, Please check your network and try again.',
  ]);

  factory ResetPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return ResetPasswordFailure(
          'The email address is not registered. Please try again.',
        );
      default:
        return ResetPasswordFailure();
    }
  }
}

class CreateAccountFailure implements HealablesException {
  @override
  final String message;

  CreateAccountFailure([
    this.message = 'A error occurred, Please check your network and try again.',
  ]);

  factory CreateAccountFailure.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return CreateAccountFailure(
          'The email address is already in use. Please try again.',
        );
      default:
        return CreateAccountFailure();
    }
  }
}

class LogInWithEmailAndPasswordFailure implements HealablesException {
  @override
  final String message;

  const LogInWithEmailAndPasswordFailure([
    this.message = 'A error occurred, Please check your network and try again.',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'The email address is badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'The user account has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'E-mail or password invalid.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
