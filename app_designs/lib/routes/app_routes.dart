
import 'package:flutter/material.dart';
import 'package:app_designs/screens/screens.dart';

class AppRoutes
{
  static const initialRoute = 'basic';
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'basic':(_) => const BasicScreen(),
    'scroll':(_) => const ScrollScreen(),
    'home':(_) => const HomeScreen(),
  };


}