import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:cleanarquitecture_numbers_app/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia?>>? call(NoParams params) {
    return numberTriviaRepository.getRandomNumberTrivia();
  }
}

