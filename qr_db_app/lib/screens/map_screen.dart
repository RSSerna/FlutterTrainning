import 'package:flutter/material.dart';
import 'package:qr_db_app/models/scan_model.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scanModel =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Center(
        child: Text(scanModel.valor),
      ),
    );
  }
}
