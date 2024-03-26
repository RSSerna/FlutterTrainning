import 'package:backgrounds_custompainter_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeChanger(2), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).themeData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
