import 'package:flutter/material.dart';

class BotonNaranjaWidget extends StatelessWidget {
  const BotonNaranjaWidget(
      {Key? key,
      required this.texto,
      required this.height,
      required this.width,
      this.color = Colors.orange})
      : super(key: key);
  final String texto;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          texto,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
