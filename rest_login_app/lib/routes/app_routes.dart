import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = ChechAuthScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    LoginScreen.routeName:(p0) => const LoginScreen(),
    ProductScreen.routeName:(p0) => const ProductScreen(),
    RegisterScreen.routeName:(p0) => const RegisterScreen(),
    ChechAuthScreen.routeName:(p0) => const ChechAuthScreen()
  };
}
