import 'package:animate_do/animate_do.dart';
import 'package:animation_do_app/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amination do'), actions: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.twitter),
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => const TwitterScreen()));
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.twitch),
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => const HomeScreen()));
          },
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => const NavegacionScreen()));
        },
        child: const FaIcon(FontAwesomeIcons.playstation),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1100),
              child: const Icon(
                Icons.new_releases,
                color: Colors.blueAccent,
                size: 40,
              ),
            ),
            FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: const Text(
                  'Titulo',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
                )),
            FadeInDown(
              delay: const Duration(milliseconds: 1200),
              child: const Text(
                'Soy un texto chitito',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1200),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
