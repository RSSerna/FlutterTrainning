import 'package:backgrounds_custompainter_app/widgets/headers_widget.dart';
import 'package:flutter/material.dart';

class HeadersScreen extends StatelessWidget {
   
  static const String routeName = 'Headers';
   
  const HeadersScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeadersCurvasWidget(),
    );
  }
}