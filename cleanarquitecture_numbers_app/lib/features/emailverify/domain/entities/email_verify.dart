import 'package:equatable/equatable.dart';

class EmailVerify extends Equatable {
  final String email;
  final String operation = "ForgotPassword";

  const EmailVerify({
    required this.email,
  });

  @override
  List<Object?> get props => [email,operation];
}
