import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    SettingsScreen.routeName:(p0) => const SettingsScreen(),
  };
}
