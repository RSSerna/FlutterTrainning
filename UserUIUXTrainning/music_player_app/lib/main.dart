import 'package:flutter/material.dart';
import 'package:music_player_app/models/audioplayer_model.dart';
import 'package:music_player_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return AudioPlayerModel();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        theme: miTema,
      ),
    );
  }
}
