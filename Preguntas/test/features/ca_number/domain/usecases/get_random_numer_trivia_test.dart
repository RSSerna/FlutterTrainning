import 'package:cleanarquitecture_numbers_app/core/usecases/usecase.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/entities/number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/repositories/number_trivia_repository.dart';

import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

Future<void> main() async {
  late GetRandomNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 2;
  const tNumberTrivia = NumberTrivia(number: tNumber, text: "test");

  test('should get trivia from the repository', () async {



    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await useCase(NoParams());

    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}

