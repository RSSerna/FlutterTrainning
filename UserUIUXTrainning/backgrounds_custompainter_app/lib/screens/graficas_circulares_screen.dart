import 'package:backgrounds_custompainter_app/widgets/radial_progress_widget.dart';
import 'package:flutter/material.dart';

class GraficasCircularesScreen extends StatefulWidget {
   
  static const String routeName = 'GraficasCirculares';
   
  const GraficasCircularesScreen({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesScreen> createState() => _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {

  double porcentaje = 0.0;
  double newPorcentaje = 0.0;
  final double cantidad = 0.1;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          porcentaje = newPorcentaje;
          newPorcentaje += cantidad;
          if (porcentaje > 1.0) {
            newPorcentaje = 0.0;
            porcentaje = 0.0;
          }
          // print(newPorcentaje);
          setState(() {});
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.refresh),
      ),
      body:  Center(
         child: Container(
           height: 300,
           width: 300,
           color: Colors.yellowAccent,
           child:  RadialProgressWidget(porcentaje: porcentaje,newPorcentaje: newPorcentaje,)),
      ),
    );
  }
}