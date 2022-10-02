import '../entity/auth.dart';
import '_repository.dart';


abstract class IAuthRepository implements Repository<Auth> {
  Future deleteByUserId(int userId);
}
