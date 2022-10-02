import 'dart:convert';

class AuthType {
  final int authTypeId;
  final String code;
  final String description;
  AuthType({
    required this.authTypeId,
    required this.code,
    required this.description,
  });

  AuthType copyWith({
    int? authTypeId,
    String? code,
    String? description,
  }) {
    return AuthType(
      authTypeId: authTypeId ?? this.authTypeId,
      code: code ?? this.code,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authTypeId': authTypeId,
      'code': code,
      'description': description,
    };
  }

  factory AuthType.fromMap(Map<String, dynamic> map) {
    return AuthType(
      authTypeId: map['authTypeId']?.toInt() ?? 0,
      code: map['code'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthType.fromJson(String source) => AuthType.fromMap(json.decode(source));

  @override
  String toString() => 'AuthType(authTypeId: $authTypeId, code: $code, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthType &&
      other.authTypeId == authTypeId &&
      other.code == code &&
      other.description == description;
  }

  @override
  int get hashCode => authTypeId.hashCode ^ code.hashCode ^ description.hashCode;
}
