import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/user.dart';
import '../../data/user_repository.dart';
import 'user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepository) : super(UserInitial()) {
    on(_onEvent);
  }
  final IUserRepository userRepository;
  void _onEvent(UserEvent event, Emitter<UserState> emit) async {
    if (event is SetUser) await _setUser(event, emit);
    if (event is UpdateUser) await _updateUser(event, emit);
  }

  Future _setUser(SetUser event, Emitter<UserState> emit) async {
    if (event.user.isInitial) {
      emit(UserInitial());
    } else {
      emit(UserLoaded(event.user));
    }
  }

  Future _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    try {
      User user = state.user.copyWith(
        userId: event.userId,
        username: event.username,
        firstName: event.firstName,
        lastName: event.lastName,
        createDate: event.createDate,
        updateDate: event.updateDate,
      );
      await userRepository.update(user);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(state.user, e.toString()));
    }
  }
}
