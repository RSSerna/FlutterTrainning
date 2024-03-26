part of 'numbert_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  final List<dynamic> properties;
  const NumberTriviaEvent(this.properties);

  @override
  List<dynamic> get props => properties;
}

class GetTriviaForConcreteNumberEvent extends NumberTriviaEvent {
  final String numberString;
  GetTriviaForConcreteNumberEvent(this.numberString) : super([numberString]);
}

class GetTriviaForRandomNumberEvent extends NumberTriviaEvent {
  const GetTriviaForRandomNumberEvent(super.properties);
}
