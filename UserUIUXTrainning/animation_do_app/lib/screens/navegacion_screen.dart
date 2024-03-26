import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionScreen extends StatelessWidget {
  static const String routeName = 'Navegacion';

  const NavegacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NotificationPage'),
        ),
        body: const Center(
          child: Text('NavegacionScreen'),
        ),
        floatingActionButton: const _floatingButtomNoti(),
        bottomNavigationBar: const _bottomNavigationNoti(),
      ),
    );
  }
}

class _bottomNavigationNoti extends StatelessWidget {
  const _bottomNavigationNoti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.blueAccent,
      items: [
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.baby), label: 'Baby'),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0,
                  right: 0,
                  // child: Icon(
                  //   Icons.brightness_1,
                  //   size: 8,
                  //   color: Colors.redAccent,
                  // ),
                  child: BounceInDown(
                    from: 20,
                    animate: (numero > 0) ? true : false,
                    child: Bounce(
                      controller: (AnimationController controller) =>
                          Provider.of<_NotificationModel>(context,
                                  listen: false)
                              .bounceController = controller,
                      from: 10,
                      child: Container(
                        width: 12,
                        height: 12,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text(
                          '$numero',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 6),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            label: 'Notifications'),
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.jugDetergent), label: 'jugDetergent'),
      ],
    );
  }
}

class _floatingButtomNoti extends StatelessWidget {
  const _floatingButtomNoti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int numero =
            Provider.of<_NotificationModel>(context, listen: false).numero;
        Provider.of<_NotificationModel>(context, listen: false).numero =
            numero + 1;

        if (numero > 0) {
          Provider.of<_NotificationModel>(context, listen: false)
              .bounceController
              .forward(from: 0.0);
        }
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  late AnimationController _bounceController;
  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController value) {
    _bounceController = value;
    // notifyListeners();
  }

  int _numero = 0;
  int get numero => _numero;

  set numero(int value) {
    _numero = value;
    notifyListeners();
  }
}
