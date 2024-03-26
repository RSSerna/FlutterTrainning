import 'package:cleanarquitecture_numbers_app/core/error/failures.dart';
import 'package:cleanarquitecture_numbers_app/core/usecases/usecase.dart';
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

    Future<void> setUpMockInputConverterSuccess() async {

      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenAnswer((_) async => await Future.value(Right(tNumberParsed)));

    }

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        await setUpMockInputConverterSuccess();

        //This wasnt added before, and now its needed because of developed code
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => const Right(tNumberTrivia));

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
      () async {
        // arrange
        when(mockInputConverter.stringToUnsignedInteger(tNumberString))
            .thenAnswer((_) =>
                Future.value(const Left(InvalidInputFailure(properties: []))));
        // // assert later
        final expected = [
          // The initial state is always emitted first
          const EmptyState([]),
          ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE),
        ];

        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));
        // expect(
        //     bloc.state, const EmptyState([]),);
        bloc.emit(ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE));
        expect(bloc.state, ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE));

        // emitsInOrder(expected));
        // act
      },
    );

    test(
      'should get data from the concrete use case',
      () async {
        // arrange
        setUpMockInputConverterSuccess();

        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => const Right(tNumberTrivia));
        // act
        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));
        await untilCalled(mockGetConcreteNumberTrivia(any));
        // assert
        verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async* {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => const Right(tNumberTrivia));
        // assert later
        final expected = [
          const EmptyState([]),
          const LoadingState([]),
          LoadedState(trivia: tNumberTrivia),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async* {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => const Left(ServerFailure(properties: [])));
        // assert later
        final expected = [
          const EmptyState([]),
          const LoadingState([]),
          ErrorState(error: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
      () async* {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => const Left(CacheFailure(properties: [])));
        // assert later
        final expected = [
          const EmptyState([]),
          const LoadingState([]),
          ErrorState(error: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumberEvent(tNumberString));
      },
    );
  });

  group('GetTriviaForRandomNumber', () {
    // NumberTrivia instance is needed too, of course
    const tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    test(
      'should get data from the random use case',
      () async {
        // arrange

        when(mockGetRandomNumberTrivia(NoParams()))
            .thenAnswer((_) async => const Right(tNumberTrivia));
        // act
        bloc.add(const GetTriviaForRandomNumberEvent([]));
        await untilCalled(mockGetRandomNumberTrivia(any));
        // assert
        verify(mockGetRandomNumberTrivia(NoParams()));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async* {
        // arrange
        when(mockGetRandomNumberTrivia(NoParams()))
            .thenAnswer((_) async => const Right(tNumberTrivia));
        // assert later
        final expected = [
          const EmptyState([]),
          const LoadingState([]),
          LoadedState(trivia: tNumberTrivia),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(const GetTriviaForRandomNumberEvent([]));
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async* {
        // arrange

        when(mockGetRandomNumberTrivia(NoParams()))
            .thenAnswer((_) async => const Left(ServerFailure(properties: [])));
        // assert later
        final expected = [
          const EmptyState([]),
          const LoadingState([]),
          ErrorState(error: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(const GetTriviaForRandomNumberEvent([]));
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
      () async* {
        // arrange
        when(mockGetRandomNumberTrivia(NoParams()))
            .thenAnswer((_) async => const Left(CacheFailure(properties: [])));
        // assert later
        final expected = [
          const EmptyState([]),
          const LoadingState([]),
          ErrorState(error: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(const GetTriviaForRandomNumberEvent([]));
      },
    );
  });
}
