part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final User user;
  ActivateUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int edad;
  ChangeUserAgeEvent(this.edad);
}

class NewUserProfesionEvent extends UserEvent {
  final String profesion;
  NewUserProfesionEvent(this.profesion);
}

class DeleteUserEvent extends UserEvent {}
