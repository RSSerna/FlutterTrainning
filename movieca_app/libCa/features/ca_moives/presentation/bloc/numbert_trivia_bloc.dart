// ignore_for_file: constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cleanarquitecture_numbers_app/core/error/failures.dart';
import 'package:cleanarquitecture_numbers_app/core/usecases/usecase.dart';
import 'package:cleanarquitecture_numbers_app/core/util/input_converter.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/entities/number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_concrete_number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'numbert_trivia_event.dart';
part 'numbert_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {required this.getConcreteNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(const EmptyState([])) {
    on<GetTriviaForConcreteNumberEvent>((event, emit) async {
      final inputEither =
          await inputConverter.stringToUnsignedInteger(event.numberString);

       inputEither.fold((error) {
        emit(ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE));
      }, (integer) async {
        emit(const LoadingState([]));
        final failureOrTrivia =
            await getConcreteNumberTrivia(Params(number: integer));
        // .then((value) => _eitherLoadedOrErrorState(emit, value));

        _eitherLoadedOrErrorState(emit, failureOrTrivia);
      });
    });

    // on<GetTriviaForConcreteNumberEvent>((event, emit) async {
    //   final Either<Failure, int> inputEither =
    //       inputConverter.stringToUnsignedInteger(event.numberString);

    //   await inputEither.fold((failure) {
    //     emit(ErrorState(error: INVALID_INPUT_FAILURE_MESSAGE));
    //   }, (integer) async {
    //     emit(const LoadingState([]));
    //     final failureOrTrivia =
    //         await getConcreteNumberTrivia(Params(number: integer));
    //     failureOrTrivia.fold((failure) {
    //       emit(ErrorState(error: _mapFailureToMessage(failure)));
    //     }, (trivia) {
    //       emit(LoadedState(trivia: trivia));
    //     });
    //   });
    // });

    // on<GetTriviaForConcreteNumberEvent1>(
    //   (event, emit) async {
    //     emit(const LoadingState([]));
    //     final failureOrTrivia = await getConcreteNumberTrivia(
    //         Params(number: int.parse(event.numberString)));
    //     failureOrTrivia.fold((failure) {
    //       emit(ErrorState(error: _mapFailureToMessage(failure)));
    //     }, (trivia) {
    //       emit(LoadedState(trivia: trivia));
    //     });
    //   },
    // );

    on<GetTriviaForRandomNumberEvent>((event, emit) async {
      emit(const LoadingState([]));
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());
      _eitherLoadedOrErrorState(emit, failureOrTrivia);
    });
  }

  void _eitherLoadedOrErrorState(Emitter<NumberTriviaState> emit,
      Either<Failure, NumberTrivia> failureOrTrivia) {
    emit(failureOrTrivia.fold((error) {
      return ErrorState(error: _mapFailureToMessage(error));
    }, (trivia) {
      return LoadedState(trivia: trivia);
    }));
  }

  String _mapFailureToMessage(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
