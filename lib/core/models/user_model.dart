import 'dart:convert';

class UserModel {
  String userId;
  String email;
  String name;
  String displayName;
  String pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    this.displayName = "",
    required this.pic,
  });

  UserModel copyWith({
    String? userId,
    String? email,
    String? name,
    String? displayName,
    String? pic,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'displayName': displayName,
      'pic': pic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      displayName: map['displayName'] ?? '',
      pic: map['pic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, email: $email, name: $name, displayName: $displayName, pic: $pic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.displayName == displayName &&
        other.pic == pic;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        name.hashCode ^
        displayName.hashCode ^
        pic.hashCode;
  }
}
