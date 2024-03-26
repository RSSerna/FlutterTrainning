import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_login_app/screens/screens.dart';
import 'package:rest_login_app/services/services.dart';

class ChechAuthScreen extends StatelessWidget {
  static const String routeName = 'ChechAuth';

  const ChechAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const Text('');
            }
            Future.microtask(() {
              if (snapshot.data == '') {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const LoginScreen(),
                          transitionDuration: const Duration(seconds: 0)
                    ));
              } else {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const HomeScreen(),
                          transitionDuration: const Duration(seconds: 0)
                    ));
              }
            });

            return Container();
          },
        ),
      ),
    );
  }
}
