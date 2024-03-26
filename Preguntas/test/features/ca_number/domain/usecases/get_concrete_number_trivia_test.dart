import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/entities/number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/repositories/number_trivia_repository.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_random_numer_trivia_test.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

//TODO: Fix Errors
@GenerateMocks([NumberTriviaRepository])
Future<void> main() async {
  late GetConcreteNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: tNumber, text: "test");

  
  test('should get concrete trivia from the repository', () async {
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await useCase(const Params(number: tNumber));

    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
