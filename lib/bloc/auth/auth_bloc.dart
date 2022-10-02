import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/user.dart';
import '../../service/auth_service.dart';
import '../user/user.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authService, this.userBloc) : super(AuthInitial()) {
    on(_onEvent);
  }
  final IAuthService authService;
  final UserBloc userBloc;
  void _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    if (event is SignIn) await _signIn(event, emit);
    if (event is SignOut) await _signOut(event, emit);
    if (event is DeleteAccount) await _deleteAccount(event, emit);
  }

  Future _signIn(SignIn event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      User user = await authService.signIn(event.username, event.password);
      userBloc.add(SetUser(user));
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthInitial());
    }
  }

  Future _signOut(SignOut event, Emitter<AuthState> emit) async {
    User initialUser = await authService.signOut();
    userBloc.add(SetUser(initialUser));
    emit(AuthInitial());
  }

  Future _deleteAccount(DeleteAccount event, Emitter<AuthState> emit) async {
    userBloc.add(SetUser(User.initial()));
    await authService.deleteUser(event.user);
    emit(AuthInitial());
  }
}
