import 'dart:math';


import 'package:flutter/material.dart';

class RadialProgressWidget extends StatefulWidget {
  const RadialProgressWidget(
      {super.key, required this.porcentaje, required this.newPorcentaje});
  final double porcentaje;
  final double newPorcentaje;
  @override
  State<RadialProgressWidget> createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    // controller.addListener(() {
    //   porcentaje = lerpDouble(
    //       widget.porcentaje, widget.newPorcentaje, controller.value)!;

    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(
                porcentaje: porcentaje, colorPrincipal: Colors.redAccent),
          ),
        );
      },
    );
    // AnimatedBuilder(animation: controller, builder: (BuildContext context, Widget child)
    // {

    // })
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
