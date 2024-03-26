import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  static const String routeName = 'Message';

  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(title: const Text('Message')),
      body:  Center(
        child: Text('$args'),
      ),
    );
  }
}
