// ignore_for_file: avoid_print

import 'package:backgrounds_custompainter_app/screens/pinterest_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final void Function()? onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenuWidget extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
      icon: Icons.pie_chart,
      onPressed: () {
        print('pie_chart');
      },
    ),
    PinterestButton(
      icon: Icons.library_add,
      onPressed: () {
        print('library_add');
      },
    ),
    PinterestButton(
      icon: Icons.aspect_ratio,
      onPressed: () {
        print('aspect_ratio');
      },
    ),
    PinterestButton(
      icon: Icons.ev_station_rounded,
      onPressed: () {
        print('ev_station_rounded ');
      },
    ),
  ];

  PinterestMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool mostrar = Provider.of<PinterestMenuModel>(context).mostrar;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: mostrar ? 1 : 0,
      child: _BackgroundMenu(child: _PinterestMenuItem(items: items)),
    );
  }
}

class _BackgroundMenu extends StatelessWidget {
  const _BackgroundMenu({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.55,
      height: size.height * 0.05,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
            )
          ]),
      child: child,
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  const _PinterestMenuItem({Key? key, required this.items}) : super(key: key);
  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(items.length,
          (index) => _PinterestButtonMenu(index: index, button: items[index])),
    );
  }
}

class _PinterestButtonMenu extends StatelessWidget {
  final int index;
  final PinterestButton button;
  const _PinterestButtonMenu(
      {Key? key, required this.index, required this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado =
        Provider.of<PinterestMenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: () {
        button.onPressed;
        Provider.of<PinterestMenuModel>(context, listen: false)
            .itemSeleccionado = index;
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        button.icon,
        color: (index == itemSeleccionado) ? Colors.black : Colors.black38,
      ),
    );
  }
}
