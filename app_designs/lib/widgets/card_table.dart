import 'dart:ui';

import 'package:flutter/material.dart';

class CardTableWidget extends StatelessWidget {
  const CardTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            icon: Icons.crop_square_sharp,
            text: 'General',
            color: Colors.lightBlue,
          ),
          _SingleCard(
            icon: Icons.directions_bus_filled_rounded,
            text: 'Transport',
            color: Colors.purpleAccent,
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.shop,
            text: 'Shopping',
            color: Colors.pink,
          ),
          _SingleCard(
            icon: Icons.reddit,
            text: 'Reddit',
            color: Colors.orangeAccent,
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.install_desktop,
            text: 'Desktop',
            color: Colors.lightGreenAccent,
          ),
          _SingleCard(
            icon: Icons.analytics,
            text: 'Analytics',
            color: Colors.redAccent,
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const _SingleCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(62, 66, 107, 0.7),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: color,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: color, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
