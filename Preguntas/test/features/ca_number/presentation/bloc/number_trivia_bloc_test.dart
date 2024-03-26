import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cleanarquitecture_numbers_app/core/util/input_converter.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_concrete_number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_random_number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/presentation/bloc/numbert_trivia_bloc.dart';

import 'number_trivia_bloc_test.mocks.dart';

// class MockGetConcreteNumberTrivia extends Mock
//     implements GetConcreteNumberTrivia {}

// class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

// class MockInputConverter extends Mock implements InputConverter {}

@GenerateNiceMocks(
    [MockSpec<GetConcreteNumberTrivia>(as: #MockGetConcreteNumberTrivia)])
@GenerateNiceMocks(
    [MockSpec<GetRandomNumberTrivia>(as: #MockGetRandomNumberTrivia)])
@GenerateNiceMocks([MockSpec<InputConverter>(as: #MockInputConverter)])
void main() {
  late NumberTriviaBloc bloc;
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
      getRandomNumberTrivia: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.state, equals(const EmptyState([])));
  });

  group('GetTriviaForConcreteNumber', () {
    // The event takes in a String
    const tNumberString = '1';
    // This is the successful output of the InputConverter
    final tNumberParsed = int.parse(tNumberString);
    // NumberTrivia instance is needed too, of course
    const tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        when(mockInputConverter.stringToUnsignedInteger(tNumberString))
            .thenReturn(Right(tNumberParsed));

        // act
        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));

        await untilCalled(
            mockInputConverter.stringToUnsignedInteger(tNumberString));
        // assert
        verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
      },
    );

    //TODO: Ask about this error
    test(
      'should emit [Error] when the input is invalid',
      () async* {
        // arrange
        when(mockInputConverter.stringToUnsignedInteger(tNumberString))
            .thenReturn(const Left(InvalidInputFailure(properties: [])));
        // assert later
        final expected = [
          // The initial state is always emitted first
          ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE),
          const EmptyState([]),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));
      },
    );
  });
}
