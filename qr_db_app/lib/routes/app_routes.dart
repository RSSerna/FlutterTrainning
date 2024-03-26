import 'package:qr_db_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final routes = {
    'home': (_) => const HomeScreen(),
    'map': (_) => const MapScreen(),
  };
}
