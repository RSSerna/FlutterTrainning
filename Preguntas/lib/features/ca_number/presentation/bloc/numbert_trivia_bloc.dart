// ignore_for_file: constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cleanarquitecture_numbers_app/core/util/input_converter.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/entities/number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_concrete_number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_random_number_trivia.dart';
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
          inputConverter.stringToUnsignedInteger(event.numberString);

      inputEither.fold((l) {
        // emit(ErrorState(error: CACHE_FAILURE_MESSAGE));
        emit(const LoadingState([]));
      }, (r) {});
    });
  }
}
