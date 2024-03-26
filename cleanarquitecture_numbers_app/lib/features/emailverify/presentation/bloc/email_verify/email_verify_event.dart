part of 'email_verify_bloc.dart';

abstract class EmailVerifyEvent extends Equatable {
  final List<dynamic> properties;
  const EmailVerifyEvent(this.properties);
  @override
  List<dynamic> get props => properties;
}

class SendEmailEvent extends EmailVerifyEvent {
  final String email;
  SendEmailEvent(this.email) : super([email]);
}

