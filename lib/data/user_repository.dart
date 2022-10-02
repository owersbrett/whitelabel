import '_repository.dart';
import 'entity/user.dart';

abstract class IUserRepository implements Repository<User> {
  Future<User> getUserByUsername(String username);
}
