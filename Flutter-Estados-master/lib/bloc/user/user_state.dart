part of 'user_bloc.dart';

@immutable 
abstract class UserState {
  final bool userExists;
  final User? user;

  const UserState({this.userExists = false, this.user});
}

class UserInitialState extends UserState{
  const UserInitialState():super(userExists: false, user: null);
}

class UserSetState extends UserState{
  final User user;
  const UserSetState(this.user): super(user: user, userExists: true);
}
