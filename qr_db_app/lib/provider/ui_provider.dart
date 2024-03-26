import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedIndexMenu = 0;
  int get selectedIndexMenu {
    return _selectedIndexMenu;
  }

  set selectedIndexMenu(int index) {
    _selectedIndexMenu = index;
    notifyListeners();
  }
}
