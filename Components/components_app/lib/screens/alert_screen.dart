import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogAndoid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 2,
            title: const Text('Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Content'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  void displayDialogIOS(BuildContext context)
  {
    showCupertinoDialog(
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
            title: const Text('Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Content'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Mostrar Alerta'),
          onPressed: () {
            Platform.isAndroid ? displayDialogAndoid(context) : displayDialogIOS(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
