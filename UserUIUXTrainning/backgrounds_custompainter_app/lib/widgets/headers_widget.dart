import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeadersCuadradoWidget extends StatelessWidget {
  const HeadersCuadradoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeadersCircularWidget extends StatelessWidget {
  const HeadersCircularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(0), bottom: Radius.circular(20))),
    );
  }
}

class HeadersCuadradoDiagWidget extends StatelessWidget {
  const HeadersCuadradoDiagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CustomPaint(
        size: size,
        painter: _HeaderDiagPainter(),
      ),
    );
  }
}

class _HeaderDiagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.35 - 20);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderDiagPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_HeaderDiagPainter oldDelegate) => false;
}

class HeadersDiagonalWidget extends StatelessWidget {
  const HeadersDiagonalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CustomPaint(
        size: size,
        painter: _HeaderFullDiagonalPainter(),
      ),
    );
  }
}

class _HeaderFullDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    // path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}

class HeadersPicoWidget extends StatelessWidget {
  const HeadersPicoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CustomPaint(
        size: size,
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.4);
    path.lineTo(size.width * 0.2, size.height * 0.4);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}

class HeadersCurvoWidget extends StatelessWidget {
  const HeadersCurvoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CustomPaint(
        size: size,
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}

class HeadersCurvasWidget extends StatelessWidget {
  const HeadersCurvasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CustomPaint(
        size: size,
        painter: _HeaderCurvasPainter(),
      ),
    );
  }
}

class _HeaderCurvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.45,
        size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}

class IconHeader extends StatelessWidget {
  const IconHeader(
      {Key? key,
      required this.icon,
      required this.titulo,
      required this.subtitulo,
      required this.color1,
      required this.color2})
      : super(key: key);

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: color1,
          color2: color2,
        ),
        Positioned(
            top: -50,
            left: -60,
            child: FaIcon(
              icon,
              size: 250,
              color: Colors.white38,
            )),
        SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  subtitulo,
                  style: const TextStyle(color: Colors.white70, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  titulo,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                FaIcon(
                  icon,
                  size: 80,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          // color: Colors.blueAccent,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color1,
                color2
              ])),
    );
  }
}
