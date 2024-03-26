import 'package:flutter/material.dart';

import 'package:api_app/models/models.dart';
import 'package:api_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'details',
        icon: Icons.details_rounded,
        name: 'Details',
        screen: const DetailScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     builder: (context) => const AlertScreen(),
  //   );
  // }
}
