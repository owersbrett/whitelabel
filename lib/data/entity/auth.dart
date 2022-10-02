import 'dart:convert';

class Auth {
  final int authId;
  final int authTypeId;
  final int userId;
  final DateTime createDate;
  final DateTime updateDate;
  final DateTime? expirationDate;
  Auth({
    required this.authId,
    required this.authTypeId,
    required this.userId,
    required this.createDate,
    required this.updateDate,
    this.expirationDate,
  });

  Auth copyWith({
    int? authId,
    int? authTypeId,
    int? userId,
    DateTime? createDate,
    DateTime? updateDate,
    DateTime? expirationDate,
  }) {
    return Auth(
      authId: authId ?? this.authId,
      authTypeId: authTypeId ?? this.authTypeId,
      userId: userId ?? this.userId,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authId': authId,
      'authTypeId': authTypeId,
      'userId': userId,
      'createDate': createDate.millisecondsSinceEpoch,
      'updateDate': updateDate.millisecondsSinceEpoch,
      'expirationDate': expirationDate?.millisecondsSinceEpoch,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      authId: map['authId']?.toInt() ?? 0,
      authTypeId: map['authTypeId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      createDate: DateTime.fromMillisecondsSinceEpoch(map['createDate']),
      updateDate: DateTime.fromMillisecondsSinceEpoch(map['updateDate']),
      expirationDate: map['expirationDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['expirationDate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) => Auth.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Auth(authId: $authId, authTypeId: $authTypeId, userId: $userId, createDate: $createDate, updateDate: $updateDate, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Auth &&
      other.authId == authId &&
      other.authTypeId == authTypeId &&
      other.userId == userId &&
      other.createDate == createDate &&
      other.updateDate == updateDate &&
      other.expirationDate == expirationDate;
  }

  @override
  int get hashCode {
    return authId.hashCode ^
      authTypeId.hashCode ^
      userId.hashCode ^
      createDate.hashCode ^
      updateDate.hashCode ^
      expirationDate.hashCode;
  }
}
