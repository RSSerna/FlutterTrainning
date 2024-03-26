import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CirculaProgressScreen extends StatefulWidget {
  static const String routeName = 'CirculaProgress';

  const CirculaProgressScreen({Key? key}) : super(key: key);

  @override
  State<CirculaProgressScreen> createState() => _CirculaProgressScreenState();
}

class _CirculaProgressScreenState extends State<CirculaProgressScreen>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  double newPorcentaje = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    controller.addListener(() {
      porcentaje = lerpDouble(porcentaje, newPorcentaje, controller.value)!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
          porcentaje = newPorcentaje;
          newPorcentaje += 0.1;
          if (newPorcentaje > 1.0) {
            newPorcentaje = 0.0;
            porcentaje = 0.0;
          }
          // print(newPorcentaje);
          controller.forward(from: 0.0);
          setState(() {});
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(
                porcentaje: porcentaje, colorPrincipal: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgressPainter extends CustomPainter {
  final double porcentaje;
  final Color colorPrincipal;

  _MyRadialProgressPainter(
      {required this.porcentaje, required this.colorPrincipal});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    final radio = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radio, paint);

    final paintArc = Paint()
      ..strokeWidth = 19
      ..color = colorPrincipal
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * porcentaje;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(_MyRadialProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_MyRadialProgressPainter oldDelegate) => false;
}
