import 'package:dartz/dartz.dart';

import 'package:poker_planning/core/errors/exceptions.dart';
import 'package:poker_planning/core/errors/failures.dart';
import 'package:poker_planning/features/EmailVerify/data/datasource/email_verify_remote_data_source.dart';
import 'package:poker_planning/features/EmailVerify/domain/entities/email_verify.dart';
import 'package:poker_planning/features/EmailVerify/domain/repositories/email_verify_repository.dart';

class EmailVerifyRepositoryImpl implements EmailVerifyRepository {
  final EmailVerifyRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  EmailVerifyRepositoryImpl({
    required this.remoteDataSource,
  });
  // required this.networkInfo});

  @override
  Future<Either<Failure, bool>> verifyExistingEmail(
      EmailVerify emailVerify) async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteTrivia =
          await remoteDataSource.verifyExistingEmail(emailVerify);
      return Right(remoteTrivia);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
    // } else {
    //   return const Left(CacheFailure());
    // }
  }
}
