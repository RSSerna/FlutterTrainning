import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/core/utils/input_converter.dart';
import 'package:clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(NumberTriviaInitialState()) {

    
    on<GetTriviaForConcreteNumberEvent>(
      (event, emit) async {
        emit(LoadingState());
        final failureOrTrivia =
            await getConcreteNumberTrivia(Params(number: event.numberString));
        failureOrTrivia.fold((failure) {
          emit(ErrorState(errorMessage: _mapFailureToMessage(failure)));
        }, (trivia) {
          emit(LoadedState(trivia: trivia));
        });
      },
    );

    on<GetTriviaForRandomNumberEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());
      failureOrTrivia!.fold((failure) {
        emit(ErrorState(errorMessage: _mapFailureToMessage(failure)));
      }, (trivia) {
        emit(LoadedState(trivia: trivia));
      });
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case CacheFailure:
      return cacheFailureMessage;
    case FormatFailure:
      return invalidInputFailureMessage;
    default:
      return 'Unexpected error';
  }
}