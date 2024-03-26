import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String msg) {
    final snackBar = SnackBar(
        content: Text(
      msg,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    ));

    scaffoldKey.currentState!.showSnackBar(snackBar);
  }
}
