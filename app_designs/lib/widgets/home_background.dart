import 'dart:math';

import 'package:flutter/material.dart';

class HomeBackgroundWidget extends StatelessWidget {
  const HomeBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Stack(
      children: const [
        _Background(),

        Positioned(
          top: -100,
          left: -30,
          child: _PinkElement(),
          ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [0.5, 0.5],
          colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ],
        ),
      ),
    
    );
  }
}

class _PinkElement extends StatelessWidget {
  const _PinkElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 360,
        height: 360,
        decoration:   BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            // stops: [0.5, 0.5],
            colors: [
              Colors.pink,
              Colors.pinkAccent,
            ],
          ),
        ),
      ),
    );
  }
}
