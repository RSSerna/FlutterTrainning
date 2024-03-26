import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyButtomWidget extends StatelessWidget {
  const EmergencyButtomWidget(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.icon,
      required this.titulo, this.onPressed, })
      : super(key: key);

  final Color color1;
  final Color color2;
  final IconData icon;
  final String titulo;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _EmergencyButtonBackground(
            color1: color1,
            color2: color2,
            icon: icon,
          ),
          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  titulo,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EmergencyButtonBackground extends StatelessWidget {
  const _EmergencyButtonBackground({
    Key? key,
    required this.color1,
    required this.color2,
    required this.icon,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
            )
          ],
          gradient: LinearGradient(colors: [color1, color2])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -30,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white30,
                ))
          ],
        ),
      ),
    );
  }
}
