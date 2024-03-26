import 'package:cleanarquitecture_numbers_app/features/ca_number/presentation/screens/number_trivia_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number Trivia',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: const NumberTriviaPage(),
    );
  }
}
