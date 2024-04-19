import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
  final String? id;
  final String? name;
  final String? email;
  final String? password;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
