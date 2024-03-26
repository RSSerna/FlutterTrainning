import 'package:flutter/material.dart';
import 'package:components_app/router/app_routes.dart';
import 'package:components_app/theme/app_theme.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(), 
      onGenerateRoute:AppRoutes.onGenerateRoute,
      theme: AppTheme.lightTheme,
    ); 
  }
}