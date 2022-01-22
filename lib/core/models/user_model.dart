import 'dart:convert';

class UserModel {
  String userName;
  String displayName;
  String pic;
  UserModel({
    required this.userName,
    required this.displayName,
    required this.pic,
  });

  UserModel copyWith({
    String? userName,
    String? displayName,
    String? pic,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      displayName: displayName ?? this.displayName,
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'displayName': displayName,
      'pic': pic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] ?? '',
      displayName: map['displayName'] ?? '',
      pic: map['pic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(userName: $userName, displayName: $displayName, pic: $pic)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userName == userName &&
        other.displayName == displayName &&
        other.pic == pic;
  }

  @override
  int get hashCode => userName.hashCode ^ displayName.hashCode ^ pic.hashCode;
}
