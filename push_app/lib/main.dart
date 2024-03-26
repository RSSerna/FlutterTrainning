import 'package:flutter/material.dart';
import 'package:push_app/screens/message_screem.dart';
import 'package:push_app/services/push_notification_service.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PushNotificationService.messageStream.listen((msg) {
      print('MyApp2: $msg');

      navigatorKey.currentState?.pushNamed(MessageScreen.routeName, arguments: msg);

      final SnackBar snackBar = SnackBar(
        content: Text(msg),
      );
      scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      scaffoldMessengerKey: scaffoldKey,
      navigatorKey: navigatorKey,
    );
  }
}
