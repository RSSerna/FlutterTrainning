import 'package:backgrounds_custompainter_app/screens/screens.dart';
import 'package:backgrounds_custompainter_app/widgets/pinterest_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  static const String routeName = 'Pinterest';

  const PinterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (BuildContext context) {
        return PinterestMenuModel();
      },
      child: Stack(
        children: [
          PinterestGrid(),
          SafeArea(
            child: Align(
              alignment: const Alignment(0.0, 0.95),
              child: PinterestMenuWidget(),
            ),
          ),
        ],
      ),
    ));
  }
}

class PinterestGrid extends StatefulWidget {
  PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double valorAnterior = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset > valorAnterior) {
        Provider.of<PinterestMenuModel>(context,listen: false).mostrar = true;
      } else {
        Provider.of<PinterestMenuModel>(context, listen: false).mostrar = false;
      }

      valorAnterior = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadiusDirectional.circular(15)),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(2, index.isEven ? 2 : 3);
      },
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}

class PinterestMenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  bool _mostrar = true;
  bool get mostrar => _mostrar;

  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners(); 
  }

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int value) {
    _itemSeleccionado = value;
    notifyListeners();
  }
}
