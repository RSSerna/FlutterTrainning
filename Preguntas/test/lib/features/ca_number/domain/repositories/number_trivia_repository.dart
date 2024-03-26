import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';


abstract class NumberTriviaRepository{
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}