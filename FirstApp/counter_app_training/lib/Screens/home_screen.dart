
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    const TextStyle fontSize30 = TextStyle(fontSize: 30);
    int counter = 10;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("TitleHS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("Clicks Counter", style: fontSize30,),
            Text('$counter', style: fontSize30,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          print(counter);
        },
        child: const Icon(
            Icons.add
        ),
      ),
    );
  }

}  