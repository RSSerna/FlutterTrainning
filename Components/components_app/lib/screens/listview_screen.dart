import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {

  final options = const ['Megaman','Mario','Zelda','Sonic'];
   
  const ListViewScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('LVScreen'),
      ),
      body: ListView(
        children:  [
          ...options.map((game) => ListTile(
            leading: const Icon(Icons.abc),
            title: Text(game),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ))
        ],
      )
    );
  }
} 