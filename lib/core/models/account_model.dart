import 'dart:convert';

class AccountModel {
  String userId;
  String username;
  String email;
  AccountModel({
    required this.userId,
    required this.username,
    required this.email,
  });

  AccountModel copyWith({
    String? userId,
    String? username,
    String? email,
  }) {
    return AccountModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      userId: map['userId'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AccountModel(userId: $userId, username: $username, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.userId == userId &&
        other.username == username &&
        other.email == email;
  }

  @override
  int get hashCode => userId.hashCode ^ username.hashCode ^ email.hashCode;
}
