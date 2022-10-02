import 'package:equatable/equatable.dart';

import '../../data/entity/user.dart';

abstract class UserState extends Equatable {
  User get user;
  @override
  List<Object> get props => [user];
}

class UserInitial extends UserState {
  @override
  User get user => User.initial();
}

class UserLoaded extends UserState {
  UserLoaded(this._user);
  final User _user;

  @override
  User get user => _user;
}

class UserError extends UserState {
  UserError(this._user, this.error);
  final User _user;
  final String error;

  @override
  User get user => _user;
}
