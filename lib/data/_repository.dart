export 'auth_repository.dart';
export 'auth_type_repository.dart';
export 'user_repository.dart';

export 'mock/mock_auth_repository.dart';
export 'mock/mock_auth_type_repository.dart';
export 'mock/mock_user_repository.dart';

abstract class Repository<T> {
  Map<int, T> cache;
  Repository() : cache = {};

  Future<T> create(T t);
  Future<bool> update(T t);
  Future<bool> delete(T t);
  Future<T> getById(int id);
}
