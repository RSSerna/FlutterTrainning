part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operator;
  final bool usingPoint;

  CalculatorState(
      {required this.mathResult,
      required this.firstNumber,
      required this.usingPoint,
      required this.secondNumber,
      required this.operator});

  // CalculatorState copyWith({
  //   String? mathResult,
  //   String? firstNumber,
  //   String? secondNumber,
  //   String? operator,
  // }) =>
  //     CalculatorState(
  //         firstNumber: firstNumber ?? this.firstNumber,
  //         mathResult: mathResult ?? this.mathResult,
  //         operator: operator ?? this.operator,
  //         secondNumber: secondNumber ?? this.secondNumber);
}

class CalculatorACState extends CalculatorState {
  CalculatorACState()
      : super(mathResult: '', firstNumber: '', secondNumber: '', operator: '',usingPoint: false);
}

class SetCalculatorState extends CalculatorState {
  SetCalculatorState(
      {required String mathResult,
      required String firstNumber,
      required String secondNumber,
      required String operator,
      required bool usingPoint,})
      : super(
            mathResult: mathResult,
            firstNumber: firstNumber,
            secondNumber: secondNumber,
            operator: operator,
            usingPoint: usingPoint);
}

