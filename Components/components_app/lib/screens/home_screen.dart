import 'package:flutter/material.dart';

import 'package:components_app/theme/app_theme.dart';
import 'package:components_app/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Componenetes en Flutter'),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Icon(
                AppRoutes.menuOptions[index].icon, color: AppTheme.primaryColor,
              ),
              title: Text(AppRoutes.menuOptions[index].name),
              onTap: () {
                // final route = MaterialPageRoute(
                //   builder:(context) => const ListViewScreen(),
                //   );
                // Navigator.push(context, route);

                Navigator.pushNamed(
                    context, AppRoutes.menuOptions[index].route);
              },
            );
          }),
          separatorBuilder: ((_, __) => const Divider()),
          itemCount: AppRoutes.menuOptions.length),
    );
  }
}
