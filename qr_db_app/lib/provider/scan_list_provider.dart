import 'package:flutter/material.dart';
import 'package:qr_db_app/models/scan_model.dart';
import 'package:qr_db_app/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scanModels = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if (nuevoScan.tipo == tipoSeleccionado) {
      scanModels.add(nuevoScan);
    }
    notifyListeners();
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScans();
    if (scans != null) {
      scanModels = [...scans];
    }else{
      scanModels =[];
    }
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScanByTipo(tipo);
    if (scans != null) {
      scanModels = [...scans];
    } else {
      scanModels = [];
    }
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scanModels = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScansPorTipo(tipoSeleccionado);
  }
}
