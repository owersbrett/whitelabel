import '../../data/entity/user.dart';

abstract class UserEvent {
  const UserEvent();
}

class SetUser extends UserEvent {
  const SetUser(this.user);
  final User user;
}

class UpdateUser extends UserEvent {
  final int? userId;
  final String? username;
  final String? firstName;
  final String? lastName;
  final DateTime? createDate;
  final DateTime? updateDate;
  const UpdateUser({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.createDate,
    this.updateDate,
  });
}

