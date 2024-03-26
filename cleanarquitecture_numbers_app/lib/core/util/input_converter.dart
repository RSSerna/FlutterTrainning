import 'package:cleanarquitecture_numbers_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Future<Either<Failure, int>> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Future.value(Right(integer));
    } on FormatException {
      return Future.value(const Left(InvalidInputFailure(properties: [])));
    }
  }
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({required super.properties});
}
