import 'package:dartz/dartz.dart';

import 'package:poker_planning/core/errors/failures.dart';
import 'package:poker_planning/core/usecase/usecase.dart';
import 'package:poker_planning/features/EmailVerify/domain/entities/email_verify.dart';
import 'package:poker_planning/features/EmailVerify/domain/repositories/email_verify_repository.dart';

class VerifyExistingEmail implements UseCase<bool, EmailVerify>{
  final EmailVerifyRepository repository;

  VerifyExistingEmail(this.repository);

  @override
  Future<Either<Failure, bool>> call(EmailVerify params)  {
     return repository.verifyExistingEmail(params);
  }
}
