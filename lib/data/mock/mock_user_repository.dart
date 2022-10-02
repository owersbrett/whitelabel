import '../../error/not_found.dart';
import '../entity/user.dart';
import '../user_repository.dart';

class MockUserRepository implements IUserRepository {
  @override
  Map<int, User> cache;
  MockUserRepository() : cache = {} {
    User user = User(
      userId: 0,
      username: "username",
      firstName: "Super",
      lastName: "User",
      createDate: DateTime.now(),
      updateDate: DateTime.now(),
    );
    cache[user.userId] = user;
  }

  @override
  Future<User> create(User t) async {
    cache[t.userId] = t;
    return t;
  }

  @override
  Future<bool> delete(User t) async {
    cache.remove(t.userId);
    return true;
  }

  @override
  Future<User> getById(int id) async {
    User? user = cache[id];
    if (user == null) throw NotFound<User>();
    return user;
  }

  @override
  Future<bool> update(User t) async {
    cache[t.userId] = t;
    return true;
  }

  @override
  Future<User> getUserByUsername(String username) async {
    User user = cache.values.firstWhere((element) => element.username == username, orElse: () => User.initial());
    if (user.isInitial) throw NotFound<User>();
    return user;
  }
}
