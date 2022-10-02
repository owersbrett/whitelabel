import '../../error/not_found.dart';
import '../auth_repository.dart';
import '../entity/auth.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  Map<int, Auth> cache;
  MockAuthRepository() : cache = {} {
    Auth auth = Auth(
      authId: 0,
      authTypeId: 0,
      userId: 0,
      createDate: DateTime.now(),
      updateDate: DateTime.now(),
    );
    cache[auth.authId] = auth;
  }
  @override
  Future<Auth> create(Auth t) async {
    cache[t.authId] = t;
    return t;
  }

  @override
  Future<bool> delete(Auth t) async {
    cache.remove(t.authId);
    return true;
  }

  @override
  Future<Auth> getById(int id) async {
    Auth? auth = cache[id];
    if (auth == null) throw NotFound<Auth>();
    return auth;
  }

  @override
  Future<bool> update(Auth t) async {
    cache[t.authId] = t;
    return true;
  }

  @override
  Future deleteByUserId(int userId) async {
    var auths = Map<int, Auth>.from(cache);
    for (var auth in auths.values) {
      if (auth.userId == userId) {
        cache.remove(auth.authId);
      }
    }
    return true;
  }
}
