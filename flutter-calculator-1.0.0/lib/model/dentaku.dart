class Dentaku {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operator;

  Dentaku(
      {required this.mathResult,
      required this.firstNumber,
      required this.secondNumber,
      required this.operator});

  Dentaku copyWith({
    String? mathResult,
    String? firstNumber,
    String? secondNumber,
    String? operator,
  }) =>
      Dentaku(
          firstNumber: firstNumber ?? this.firstNumber,
          mathResult: mathResult ?? this.mathResult,
          operator: operator ?? this.operator,
          secondNumber: secondNumber ?? this.secondNumber);
}
