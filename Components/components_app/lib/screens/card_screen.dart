import 'package:flutter/material.dart';

import 'package:components_app/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        children: const  [
          CustomCardType1(),
          CustomCardType2( imageUrl: 'https://img.freepik.com/free-vector/hand-drawn-flat-design-mountain-landscape_52683-79195.jpg?w=2000',),
          CustomCardType2(imageUrl: 'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg', title: 'Beuty BG',)
        ],
      ),
    );
  }
}


