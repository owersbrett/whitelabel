

import '../../error/not_found.dart';
import '../auth_type_repository.dart';
import '../entity/auth_type.dart';

class MockAuthTypeRepository implements IAuthTypeRepository {
  @override
  Map<int, AuthType> cache;
  MockAuthTypeRepository() : cache = {} {
    AuthType authType = AuthType(
      authTypeId: 0,
      code: "ADMIN",
      description: "ADMIN",
    );
    cache[authType.authTypeId] = authType;
  }

  @override
  Future<AuthType> create(AuthType t) async {
    cache[t.authTypeId] = t;
    return t;
  }

  @override
  Future<bool> delete(AuthType t) async {
    cache.remove(t.authTypeId);
    return true;
  }

  @override
  Future<AuthType> getById(int id) async {
    AuthType? authType = cache[id];
    if (authType == null) throw NotFound<AuthType>();
    return authType;
  }

  @override
  Future<bool> update(AuthType t) async {
    cache[t.authTypeId] = t;
    return true;
  }
}
