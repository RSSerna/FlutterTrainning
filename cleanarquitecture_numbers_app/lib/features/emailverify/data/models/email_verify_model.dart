import 'dart:convert';

import 'package:poker_planning/features/EmailVerify/domain/entities/email_verify.dart';

class EmailVerifyModel extends EmailVerify {
  const EmailVerifyModel({required String email})
      : super(email: email);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "email": email,
        "operation": "ForgotPassword",
      };
}
