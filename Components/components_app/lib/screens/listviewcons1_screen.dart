import 'package:flutter/material.dart';

class ListViewConsOneScreen extends StatelessWidget {

  final options = const ['Megaman','Mario','Zelda','Sonic'];
   
  const ListViewConsOneScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('LVScreenConsOne'),
      ),
      body: ListView.separated(
        itemCount: options.length, 
        itemBuilder: (BuildContext context, int index) {  
          return ListTile(
            leading: const Icon(Icons.abc),
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined ),
          );
        }, 
        separatorBuilder: (BuildContext _, int __) => const Divider(),
        
      )
    );
  }
} 