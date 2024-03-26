import 'package:flutter/material.dart';
import 'package:calculadora/widgets/calc_button.dart';
import 'package:calculadora/widgets/results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator/calculator_bloc.dart'; 


class CalculatorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CalculatorBloc calculatorBloc = BlocProvider.of<CalculatorBloc>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric( horizontal: 10 ),
          child: Column(
            children: [
              
              Expanded(
                child: Container(),
              ),

              ResultsWidget(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: 'AC',
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add(ResetACEvent()),
                  ),
                  CalculatorButton( 
                    text: '+/-',
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add(ChangeNegativePositiveEvent()),
                  ),
                  CalculatorButton( 
                    text: 'DEL',
                    bgColor: Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add(DeleteLastEntryEvent()),
                  ),
                  CalculatorButton( 
                    text: '/',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntryEvent('/')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '7',
                    onPressed: () => calculatorBloc.add(AddNumerEvent('7')),
                  ),
                  CalculatorButton( 
                    text: '8',
                    onPressed: () => calculatorBloc.add(AddNumerEvent('8')),
                  ),
                  CalculatorButton( 
                    text: '9',
                    onPressed: () => calculatorBloc.add(AddNumerEvent('9')),
                  ),
                  CalculatorButton( 
                    text: 'X',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntryEvent('X')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '4', 
                    onPressed: () => calculatorBloc.add(AddNumerEvent('4')),
                  ),
                  CalculatorButton( 
                    text: '5', 
                    onPressed: () => calculatorBloc.add(AddNumerEvent('5')),
                  ),
                  CalculatorButton( 
                    text: '6', 
                    onPressed: () => calculatorBloc.add(AddNumerEvent('6')),
                  ),
                  CalculatorButton( 
                    text: '-',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntryEvent('-')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '1', 
                    onPressed: () => calculatorBloc.add(AddNumerEvent('1')),
                  ),
                  CalculatorButton( 
                    text: '2', 
                    onPressed: () => calculatorBloc.add(AddNumerEvent('2')),
                  ),
                  CalculatorButton( 
                    text: '3', 
                    onPressed: () => calculatorBloc.add(AddNumerEvent('3')),
                  ),
                  CalculatorButton(
                    text: '+',  
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntryEvent('+')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '0', 
                    big: true,
                    onPressed: () => calculatorBloc.add(AddNumerEvent('0')),
                  ),
                  CalculatorButton( 
                    text: '.', 
                    onPressed: () => calculatorBloc.add(AddPointEvent()),
                  ),
                  CalculatorButton( 
                    text: '=',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(CalculateResultEvent()),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}