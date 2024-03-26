
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    
    const TextStyle fontSize30 = TextStyle(fontSize: 30);
    void increase() => setState(() => counter++);
    void decrease() => setState(() => counter--);
    void restart() => setState(() => counter = 0);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("CounterScreen"),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButtoms(
        incrementFn: increase,
        restartFn: restart,
        decrementFn: decrease,
        ),
    );
  }
}

class CustomFloatingActionButtoms extends StatelessWidget {

  final Function incrementFn,decrementFn,restartFn;

  const CustomFloatingActionButtoms({
    Key? key, required this.incrementFn, required this.decrementFn, required this.restartFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () =>  incrementFn() ,
          child: const Icon(
              Icons.exposure_plus_1_sharp
          ),
        ),

        FloatingActionButton(
          onPressed: () =>  restartFn(),
          child: const Icon(
              Icons.restart_alt
          ),
        ),
         
        FloatingActionButton(
          onPressed:() =>   decrementFn(),
          child: const Icon(
              Icons.exposure_minus_1_rounded
          ),
        ),
      ],
    );
  }
}  