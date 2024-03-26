part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetACEvent extends CalculatorEvent{}
class ChangeNegativePositiveEvent extends CalculatorEvent{}
class DeleteLastEntryEvent extends CalculatorEvent{}
class CalculateResultEvent extends CalculatorEvent{}
class AddPointEvent extends CalculatorEvent{}


class AddNumerEvent extends CalculatorEvent{
  final String number;
  AddNumerEvent(this.number);
}

class OperationEntryEvent extends CalculatorEvent{
  final String operation; 
  OperationEntryEvent(this.operation);
}



