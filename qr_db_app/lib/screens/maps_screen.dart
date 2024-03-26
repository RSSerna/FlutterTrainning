import 'package:flutter/material.dart';
import 'package:qr_db_app/widgets/historial_listview.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HistorialListView(
      tipo: 'geo',
    );
  }
}
