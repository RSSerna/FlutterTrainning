import 'package:flutter/material.dart';

import '../share_preferences/preferences.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Divider(),
          Text('Darkmode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Name: ${Preferences.name}'),
          const Divider(),
          Text('Gender: ${Preferences.gender}'),
          const Divider(),
        ],
      ),
    );
  }
}
