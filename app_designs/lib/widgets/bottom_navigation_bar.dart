import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.pinkAccent,
      backgroundColor:  Colors.deepPurple,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // onTap: ,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'calendar',),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'chart'),
        BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_rounded), label: 'award'),
      ],
    );
  }
}
