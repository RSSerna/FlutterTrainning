import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width = 50;
  double _height =50;
  Color _color = Colors.cyan;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(15);

  void changeShape(){
    Random random = Random();
    _width  = random.nextInt(300).toDouble() + 20;
    _height = random.nextInt(300).toDouble() + 20;
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextDouble());
    _borderRadius = BorderRadius.circular(random.nextInt(90).toDouble() + 10);
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_outline_outlined, size: 35,),
        onPressed: (){
          changeShape();

        }
      ),
    );
  }
}
