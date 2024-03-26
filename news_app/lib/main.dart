import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) =>  NewsService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        theme: AppTheme.appThemeDark,
      ),
    );
  }
}