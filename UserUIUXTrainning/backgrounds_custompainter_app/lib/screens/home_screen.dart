import 'package:backgrounds_custompainter_app/routes/app_routes.dart';
import 'package:backgrounds_custompainter_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disenos Flutter'),
      ),
      drawer: const _BurgerMenu(),
      body: const _OptionsList(),
    );
  }
}

class _BurgerMenu extends StatelessWidget {
  const _BurgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: double.infinity,
                child:  CircleAvatar(
                  backgroundColor: themeChanger.themeData.colorScheme.secondary,
                  child: const Text(
                    'FH',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              const Expanded(child: _OptionsList()),
              ListTile(
                leading:  Icon(
                  Icons.lightbulb,
                  color: themeChanger.themeData.colorScheme.secondary,
                ),
                title: const Text('DarkMode'),
                trailing: Switch.adaptive(
                    value: themeChanger.darkTheme,
                    activeColor: themeChanger.themeData.colorScheme.secondary,
                    onChanged: (value) {
                      themeChanger.darkTheme = value;
                    }),
              ),
              ListTile(
                leading:  Icon(
                  Icons.add_to_home_screen_outlined,
                  color: themeChanger.themeData.colorScheme.secondary,
                ),
                title: const Text('CustomTheme'),
                trailing: Switch.adaptive(
                    value: themeChanger.customTheme,
                    activeColor: themeChanger.themeData.colorScheme.secondary,
                    onChanged: (value) {
                      themeChanger.customTheme = value;
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Provider.of<ThemeChanger>(context).themeData;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      separatorBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(
          Icons.chevron_right_rounded,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[index].page));
        },
      ),
    );
  }
}
