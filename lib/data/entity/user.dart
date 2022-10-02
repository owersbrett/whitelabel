import 'dart:convert';

class User {
  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final DateTime createDate;
  final DateTime updateDate;
  User({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.createDate,
    required this.updateDate,
  });

  factory User.initial() {
    return User(
      userId: -1,
      username: "Anon",
      firstName: "Initial",
      lastName: "User",
      createDate: DateTime.now(),
      updateDate: DateTime.now(),
    );
  }
  bool get isInitial => username.toLowerCase() == "anon";

  User copyWith({
    int? userId,
    String? username,
    String? firstName,
    String? lastName,
    DateTime? createDate,
    DateTime? updateDate,
  }) {
    return User(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'createDate': createDate.millisecondsSinceEpoch,
      'updateDate': updateDate.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId']?.toInt() ?? 0,
      username: map['username'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      createDate: DateTime.fromMillisecondsSinceEpoch(map['createDate']),
      updateDate: DateTime.fromMillisecondsSinceEpoch(map['updateDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, firstName: $firstName, lastName: $lastName, createDate: $createDate, updateDate: $updateDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userId == userId &&
        other.username == username &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.createDate == createDate &&
        other.updateDate == updateDate;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        username.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        createDate.hashCode ^
        updateDate.hashCode;
  }
}
