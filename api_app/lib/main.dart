import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:api_app/providers/movies_provider.dart';
import 'package:api_app/routes/app_routes.dart';
import 'package:api_app/theme/app_theme.dart';


void main() => runApp(const AppProvider());

class AppProvider extends StatelessWidget {
  const AppProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => MovieProvider(), lazy: false,)
      ],
      child: const MyApp(),
      );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas', 
      initialRoute: 'home',
      routes: AppRoutes.getAppRoutes(),
      theme: AppTheme.lightTheme,
    );
  }
}
