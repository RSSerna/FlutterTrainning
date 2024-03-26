import 'package:flutter/material.dart';
import 'package:push_app/screens/message_screem.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    MessageScreen.routeName:(p0) => const MessageScreen(),
  };
}
