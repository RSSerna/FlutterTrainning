import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/provider/theme_provider.dart';
import 'package:user_preferences/widgets/side_menu_wgt.dart';

import '../share_preferences/preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // int radio = 3;
  // String name = 'Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkmode,
                    title: const Text('Darkmode'),
                    onChanged: (value) {
                      Preferences.isDarkmode = value;
                      setState(() {
                        value
                            ? Provider.of<ThemeProvider>(context, listen: false)
                                .setDarkMode()
                            : Provider.of<ThemeProvider>(context, listen: false)
                                .setLightMode();
                      });
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.gender,
                    title: const Text('Masculine'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.gender,
                    title: const Text('Femenine'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                        helperText: 'Users name', labelText: 'Name'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
