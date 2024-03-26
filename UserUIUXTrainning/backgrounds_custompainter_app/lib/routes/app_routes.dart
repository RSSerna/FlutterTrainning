import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    HeadersScreen.routeName: (p0) => const HeadersScreen(),
    AnimacionesScreen.routeName: (p0) => const AnimacionesScreen(),
    AnimacionRetoScreen.routeName: (p0) => const AnimacionRetoScreen(),
    CirculaProgressScreen.routeName: (p0) => const CirculaProgressScreen(),
    GraficasCircularesScreen.routeName: (p0) =>
        const GraficasCircularesScreen(),
    SlideShowScreen.routeName: (p0) => const SlideShowScreen(),
    SlideShowsScreen.routeName: (p0) => const SlideShowsScreen(),
    PinterestScreen.routeName: (p0) => const PinterestScreen(),
    EmergencyScreen.routeName: (p0) => const EmergencyScreen(),
    SliderListScreen.routeName: (p0) => const SliderListScreen(),
  };
}

final pageRoutes = <_Routes>[
  _Routes(FontAwesomeIcons.slideshare, 'Slideshow', const SlideShowsScreen()),
  _Routes(FontAwesomeIcons.truckMedical, 'Emergencia', const EmergencyScreen()),
  _Routes(FontAwesomeIcons.heading, 'Encabezados', const HeadersScreen()),
  _Routes(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado',
      const AnimacionesScreen()),
  _Routes(FontAwesomeIcons.circleNotch, 'Barra Progreso',
      const GraficasCircularesScreen()),
  _Routes(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestScreen()),
  _Routes(FontAwesomeIcons.mobile, 'Slivers', const SliderListScreen()),
];

class _Routes {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);
}
