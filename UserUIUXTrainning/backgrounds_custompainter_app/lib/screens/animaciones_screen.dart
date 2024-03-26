import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'dart:math' as Math;

class AnimacionesScreen extends StatelessWidget {
  static const String routeName = 'Animaciones';

  const AnimacionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDch;
  late Animation<double> escalar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1, curve: Curves.easeOut)));

    moverDch = Tween(begin: 0.0, end: 200.0).animate(controller);

    escalar = Tween(begin: 2.0, end: 0.5).animate(controller);

    // controller.addListener(() {
    //   if (controller.status == AnimationStatus.completed) {
    //     controller.reverse();
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDch.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
                opacity: opacidad.value - opacidadOut.value,
                child: Transform.scale(
                    scale: escalar.value, child: const _RectanguloWidget())),
          ),
        );
      },
    );
  }
}

class _RectanguloWidget extends StatelessWidget {
  const _RectanguloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.blueGrey,
      child: const Center(
          //  child: Text('RectanguloWidget'),

          ),
    );
  }
}
