import 'package:flutter/material.dart';
import 'package:formulario_arq/screens/screens.dart';
import 'package:formulario_arq/screens/search_screen.dart';

class AppRoutes {
  static String initalRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = 
  {
    'home':(_) => const HomeScreen(),
    'modificar':(_) => const ModifyFormScreen(),
    'crear':(_) => const NewFormScreen(),
    'buscar':(_) => const SearchScreen(),

  };
}