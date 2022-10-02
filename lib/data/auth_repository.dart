import '_repository.dart';
import 'entity/auth.dart';

abstract class IAuthRepository implements Repository<Auth> {
  Future deleteByUserId(int userId);
}
