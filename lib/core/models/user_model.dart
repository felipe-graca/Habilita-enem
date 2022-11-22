// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String email;
  final String name;
  final int points;
  final String base64Image;
  const UserModel({
    this.id = '',
    this.email = '',
    this.name = '',
    this.points = 0,
    this.base64Image = '',
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    int? points,
    String? base64Image,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      points: points ?? this.points,
      base64Image: base64Image ?? this.base64Image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'points': points,
      'base64Image': base64Image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      points: map['points'] as int,
      base64Image: map['base64Image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, points: $points, base64Image: $base64Image)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.points == points &&
        other.base64Image == base64Image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        points.hashCode ^
        base64Image.hashCode;
  }
}
