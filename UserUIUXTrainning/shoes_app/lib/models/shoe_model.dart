import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImag = 'assets/azul.png';
  double _talla = 9.5;
  String get assetImag => _assetImag;

  set assetImag(String value) {
    _assetImag = value;
    notifyListeners();
  }

  get talla => _talla;

  set talla(value) {
    _talla = value;
    notifyListeners(); 
  }
}
