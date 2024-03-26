import 'package:poker_planning/core/constants/api.dart';
import 'package:poker_planning/core/http/custom_http_client.dart';
import 'package:poker_planning/features/EmailVerify/data/models/email_verify_model.dart';
import 'package:poker_planning/features/EmailVerify/domain/entities/email_verify.dart';

abstract class EmailVerifyRemoteDataSource {
  Future<bool> verifyExistingEmail(EmailVerify emailVerify);
}

class EmailVerifyRemoteDataSourceImpl implements EmailVerifyRemoteDataSource {
  final CustomHttpClient client;

  EmailVerifyRemoteDataSourceImpl({required this.client});

  @override
  Future<bool> verifyExistingEmail(EmailVerify emailVerify) async {
    try {
      // final jsonData = 
      await client.post(
        path: API.api_create_otp_code,
        body: 
        EmailVerifyModel(
          email: emailVerify.email,
        ).toJson(),
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
