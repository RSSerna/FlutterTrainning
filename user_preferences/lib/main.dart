import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/provider/theme_provider.dart';
import 'package:user_preferences/routes/app_routes.dart';
import 'package:user_preferences/share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),)
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        theme: Provider.of<ThemeProvider>(context).currentTheme
    );
  }
}
