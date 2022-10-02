import '../data/entity/user.dart';

abstract class IAuthService {
  Future<User> signIn(String username, String password);
  Future<User> signOut();
  Future<bool> deleteUser(User user);
}
