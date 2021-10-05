import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final String password;
  final String position;
  final String type;
  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.position,
    required this.type,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? password,
    String? position,
    String? type,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      position: position ?? this.position,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'position': position,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      password: map['password'],
      position: map['position'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, password: $password, position: $position, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.email == email &&
      other.name == name &&
      other.password == password &&
      other.position == position &&
      other.type == type;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      password.hashCode ^
      position.hashCode ^
      type.hashCode;
  }
}
