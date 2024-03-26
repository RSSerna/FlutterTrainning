// ignore_for_file: deprecated_member_use

import 'package:backgrounds_custompainter_app/widgets/emergency_buttom_widget.dart';
import 'package:backgrounds_custompainter_app/widgets/headers_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyScreen extends StatelessWidget {
  static const String routeName = 'Emergency';

  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
    ];

    List<Widget> children = List.generate(
      items.length,
      (index) => EmergencyButtomWidget(
        color1: items[index].color1,
        color2: items[index].color2,
        icon: items[index].icon,
        titulo: items[index].texto,
        onPressed: () {},
      ),
    );

    // List<Widget> itemMap = items
    //     .map((e) => EmergencyButtomWidget(
    //           color1: e.color1,
    //           color2: e.color2,
    //           icon: e.icon,
    //           titulo: e.texto,
    //           onPressed: () {},
    //         ))
    //     .toList();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 280),
          child: ListView(children: children),
        ),
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Medica',
          subtitulo: 'Haz Solicitado',
          color1: Color(0xff526BF6),
          color2: Color(0xffA4CBF6),
        ),
      ],
    ));
  }
}
