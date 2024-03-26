import 'package:flutter/material.dart';

class ShoeDescriptionWidget extends StatelessWidget {
  const ShoeDescriptionWidget(
      {Key? key, required this.titulo, required this.descripcion})
      : super(key: key);

  final String titulo;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          descripcion,
          style: const TextStyle(color: Colors.black54, height: 1.6),
        )
      ],
    ));
  }
}
