import '../../data/entity/user.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class SignIn extends AuthEvent {
  final String username;
  final String password;

  SignIn(this.username, this.password);
}

class SignOut extends AuthEvent {}

class DeleteAccount extends AuthEvent {
  DeleteAccount(this.user);
  final User user;
}
