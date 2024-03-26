import 'package:dartz/dartz.dart';

import 'package:poker_planning/core/errors/failures.dart';
import 'package:poker_planning/features/EmailVerify/domain/entities/email_verify.dart';

abstract class EmailVerifyRepository{
  Future<Either<Failure,bool>> verifyExistingEmail(EmailVerify emailVerify);
}