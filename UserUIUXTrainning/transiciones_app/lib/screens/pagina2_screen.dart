import 'package:flutter/material.dart';

class Pagina1Screen extends StatelessWidget {
   
  static const String routeName = 'Pagina1';
   
  const Pagina1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pag2'),
        ),
        backgroundColor: Colors.amberAccent,
        body: const Center(
          child: Text('Pag2'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
        ));
  }
}