part of 'numbert_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState(this.properties);
  final List<dynamic> properties;

  @override
  List<dynamic> get props => properties;
}

class EmptyState extends NumberTriviaState {
  const EmptyState(super.properties);
}

class LoadingState extends NumberTriviaState {
  const LoadingState(super.properties);
}

class LoadedState extends NumberTriviaState {
  final NumberTrivia trivia;

  LoadedState({required this.trivia}) : super([trivia]);
}
class ErrorState extends NumberTriviaState {
  final String error;
  ErrorState({required this.error}) : super([error]);
}
