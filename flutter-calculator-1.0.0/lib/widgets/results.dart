import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculadora/bloc/calculator/calculator_bloc.dart';

import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CalculatorBloc calculatorBloc = BlocProvider.of<CalculatorBloc>(context,listen: false);

    return BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
      return Column(
        children: [
          SubResult(
            text: state.firstNumber,
              // text: state.firstNumber.endsWith('.0')
              //     ? state.firstNumber.substring(0, state.firstNumber.length - 2)
              //     : state.firstNumber
                  ),
          SubResult(text: state.operator),
          SubResult(
            text: state.secondNumber,
              // text: state.secondNumber.endsWith('.0')
              //     ? state.secondNumber
              //         .substring(0, state.secondNumber.length - 2)
              //     : state.secondNumber
                  ),
          LineSeparator(),
          MainResultText(
            text: state.mathResult,
              // text: state.mathResult.endsWith('.0')
              //     ? state.mathResult.substring(0, state.mathResult.length - 2)
              //     : state.mathResult
                  ),
        ],
      );
    });
  }
}
