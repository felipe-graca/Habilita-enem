// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthModel {
  final String id;
  final String email;
  final String password;
  final String confirmedPassword;
  const AuthModel({
    this.id = '',
    this.email = '',
    this.password = '',
    this.confirmedPassword = '',
  });

  AuthModel copyWith({
    String? id,
    String? email,
    String? password,
    String? confirmedPassword,
  }) {
    return AuthModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'confirmedPassword': confirmedPassword,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'] ?? '',
      email: map['email'] as String,
      password: map['password'] as String,
      confirmedPassword: map['confirmedPassword'] as String,
    );
  }

  static const empty = AuthModel(id: '');

  bool get isEmpty => this == AuthModel.empty;

  bool get isNotEmpty => this != AuthModel.empty;

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Auth( id: $id, email: $email, password: $password, confirmedPassword: $confirmedPassword)';

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.password == password &&
        other.confirmedPassword == confirmedPassword;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      password.hashCode ^
      confirmedPassword.hashCode;
}
