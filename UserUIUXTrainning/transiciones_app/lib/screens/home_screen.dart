import 'package:flutter/material.dart';
import 'package:transiciones_app/screens/pagina2_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Center(
          child: Text('HomeScreen'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigator.push(context, _crearRuta());
          }),
        ));
  }

  Route<Object?> _crearRuta() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const Pagina1Screen(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: ((context, animation, secondaryAnimation, child) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          // return FadeTransition(
          //   opacity:
          //       Tween<double>(begin: 0.0, end: 1.0)
          //           .animate(curvedAnimation),
          //   child: child,
          // );

          // return RotationTransition(
          //   turns:
          //       Tween<double>(begin: 0.0, end: 1.0)
          //           .animate(curvedAnimation),
          //   child: child,
          // );

          // return ScaleTransition(
          //   scale:
          //       Tween<double>(begin: 0.0, end: 1.0)
          //           .animate(curvedAnimation),
          //   child: child,
          // );


          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0.5, 1), end: Offset.zero)
                    .animate(curvedAnimation),
            child: child,
          );
        }));
  }
}
