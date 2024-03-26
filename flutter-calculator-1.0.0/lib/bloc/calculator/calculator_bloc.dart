import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorACState()) {
    on<ResetACEvent>((event, emit) => emit(CalculatorACState()));

    on<ChangeNegativePositiveEvent>((event, emit) {
      emit(SetCalculatorState(
        usingPoint: state.usingPoint,
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        operator: state.operator,
        mathResult: state.mathResult.startsWith('-')
            ? state.mathResult.substring(1)
            : '-' + state.mathResult,
      ));
    });

    on<DeleteLastEntryEvent>((event, emit) {
      final bool point = true;

      emit(SetCalculatorState(
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        operator: state.operator,
        usingPoint: point,
        mathResult: state.mathResult.length > 1 &&
                !(state.mathResult.length == 2 &&
                    state.mathResult.startsWith('-'))
            ? state.mathResult.substring(0, state.mathResult.length - 1)
            : '0',
      ));
    });

    on<OperationEntryEvent>((event, emit) {
      if (state.mathResult.isEmpty) return;
      emit(SetCalculatorState(
        usingPoint: false,
        firstNumber: state.mathResult,
        secondNumber: '',
        // secondNumber: state.secondNumber,
        operator: event.operation,
        mathResult: '',
      ));
    });

    on<AddPointEvent>((event, emit) {
      if (state.usingPoint) return;

      final String mathResult =
          state.mathResult.isEmpty ? '0.' : state.mathResult + '.';

      emit(SetCalculatorState(
        usingPoint: true,
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        operator: state.operator,
        mathResult: mathResult,
      ));
    });

    on<AddNumerEvent>((event, emit) {
      String result = '';
      if (state.mathResult != '0') {
        result = state.mathResult + event.number;
      } else {
        result = event.number;
      }
      emit(SetCalculatorState(
        usingPoint: state.usingPoint,
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        operator: state.operator,
        mathResult: result,
      ));
    });

    on<CalculateResultEvent>((event, emit) {
      final double num1 = double.parse(state.firstNumber);
      final double num2 = double.parse(state.mathResult);
      final String secondNumber = state.mathResult;
      String mathResult;
      switch (state.operator) {
        case '/':
          mathResult = '${num1 / num2}';
          break;
        case 'X':
          mathResult = '${num1 * num2}';
          break;
        case '-':
          mathResult = '${num1 - num2}';
          break;
        case '+':
          mathResult = '${num1 + num2}';
          break;
        default:
          return;
      }

      // if (mathResult.endsWith('.0'))
      //   mathResult.substring(0, state.mathResult.length - 2);

      emit(SetCalculatorState(
        firstNumber: state.firstNumber,
        secondNumber: secondNumber,
        operator: state.operator,
        mathResult: mathResult,
        usingPoint: false,
      ));
    });
  }
}
