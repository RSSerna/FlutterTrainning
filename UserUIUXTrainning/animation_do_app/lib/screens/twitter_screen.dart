import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  static const String routeName = 'Twitter';

  const TwitterScreen({Key? key}) : super(key: key);

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          setState(() {
            activar = !activar;
          });
        },
      ),
      body: Center(
        child: ZoomOut(
            animate: activar,
            from: 30,
            duration: const Duration(seconds: 1),
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 50,
            )),
      ),
    );
  }
}
