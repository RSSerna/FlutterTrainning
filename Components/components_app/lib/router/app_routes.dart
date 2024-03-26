import 'package:flutter/material.dart';

import 'package:components_app/models/models.dart';
import 'package:components_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1',
        icon: Icons.list,
        name: 'ListView 1',
        screen: const ListViewScreen()),
    MenuOption(
        route: 'listview2',
        icon: Icons.list_alt,
        name: 'ListView 2',
        screen: const ListViewConsOneScreen()),
    MenuOption(
        route: 'card',
        icon: Icons.card_giftcard,
        name: 'Card Screen',
        screen: const CardScreen()),
    MenuOption(
        route: 'alert',
        icon: Icons.add_alert,
        name: 'Alert Screen',
        screen: const AlertScreen()),
    MenuOption(
        route: 'avatar',
        icon: Icons.airline_seat_individual_suite_sharp,
        name: 'Avatar Screen',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animated',
        icon: Icons.play_arrow,
        name: 'Animated Screen',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'input',
        icon: Icons.input,
        name: 'Input Screen',
        screen: const InputScreen()),
    MenuOption(
        route: 'slider',
        icon: Icons.slow_motion_video_rounded,
        name: 'Slider Screen',
        screen: const SliderScreen()),
    MenuOption(
        route: 'lvbuilder',
        icon: Icons.line_style,
        name: 'ListViewBuilder Screen',
        screen: const ListViewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }


    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'listview1': (BuildContext context) => const ListViewScreen(),
  //   'listview2': (BuildContext context) => const ListViewConsOneScreen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  //   'home': (BuildContext context) => const HomeScreen(),
  // };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
