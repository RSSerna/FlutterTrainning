import 'package:bloc/bloc.dart';
import 'package:estados/models/user.dart';
import 'package:meta/meta.dart';

part 'user_events.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivateUserEvent>((event, emit) {emit(UserSetState(event.user));});
    on<DeleteUserEvent>((event, emit) => UserInitialState());

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.userExists) return;
      emit(UserSetState(state.user!.copyWith(edad: event.edad)));
    });
    on<NewUserProfesionEvent>((event, emit) {
      if (!state.userExists) return;
      List<String> profesiones = state.user!.profesiones;
      profesiones.add(event.profesion);
      emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));
    });


  }
}
