part of 'email_verify_bloc.dart';

abstract class EmailVerifyState extends Equatable {
  const EmailVerifyState({
    this.email = '',
    this.errorStr = '',
  });
  final String email;
  // final String code;
  final String errorStr;
  @override
  List<dynamic> get props => [email, errorStr];
}

class EmailVerifyInitialState extends EmailVerifyState {
  const EmailVerifyInitialState();
}

class EmailVerifyLoadingState extends EmailVerifyState {
  const EmailVerifyLoadingState();
}

class EmailVerifyAcceptedState extends EmailVerifyState {
  const EmailVerifyAcceptedState();
}

class EmailVerifyErrorState extends EmailVerifyState {
  final String error;
  const EmailVerifyErrorState({
    required this.error,
    required String email,
  }) : super(
          email: email,
          errorStr: error,
        );
}
