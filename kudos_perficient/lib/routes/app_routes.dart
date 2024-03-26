import 'package:flutter/material.dart';
import 'package:kudos_perficient/screens/home_screen.dart';

class AppRoutes {
  static String initalRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (_) => const HomeScreen(),
  };
}
