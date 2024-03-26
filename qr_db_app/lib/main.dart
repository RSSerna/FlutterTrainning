import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:qr_db_app/provider/provider.dart'; 
import 'package:qr_db_app/routes/app_routes.dart';
import 'package:qr_db_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

//Android AIzaSyBj1_gFXmCCh7IZupebEjfPFF7UUsv5LrI
//IOs

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider(),),
        ChangeNotifierProvider(create: (_) => ScanListProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        theme: AppTheme.themeData,
      ),
    );
  }
}