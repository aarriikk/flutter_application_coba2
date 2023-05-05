import 'dart:convert';

class User {
  final String id;
  final String email;
  final String token;

  User(
      {
        required this.id,
        required this.email,
        required this.token,
      });

  Map<String, dynamic> toMap() {
    return {'email': email, 'token': token};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] ?? '',
        email: map['email'] ?? '',
        token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
