import '../../data/_repository.dart';
import '../../data/entity/user.dart';
import '../auth_service.dart';

class MockAuthService implements IAuthService {
  final IAuthRepository authRepository;
  final IUserRepository userRepository;
  final IAuthTypeRepository authTypeRepository;

  MockAuthService(this.authRepository, this.userRepository, this.authTypeRepository);
  @override
  Future<User> signIn(String username, String password) {
    return userRepository.getUserByUsername(username);
  }

  @override
  Future<bool> deleteUser(User user) async {
    await authRepository.deleteByUserId(user.userId);
    await userRepository.delete(user);
    return true;
  }

  @override
  Future<User> signOut() async {
    return User.initial();
  }
}
