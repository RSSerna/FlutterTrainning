import 'package:flutter/material.dart';

class AnimacionRetoScreen extends StatelessWidget {
  static const String routeName = 'AnimacionReto';

  const AnimacionRetoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moverDch;
  late Animation<double> moverArriba;
  late Animation<double> moverIzq;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moverDch = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moverIzq = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

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
            offset: Offset(moverDch.value + moverIzq.value,
                moverArriba.value +  moverAbajo.value),
            child: const _RectanguloWidget());
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
      color: Colors.greenAccent,
      child: const Center(
          //  child: Text('RectanguloWidget'),

          ),
    );
  }
}
