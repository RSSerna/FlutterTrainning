import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {

  final String imageUrl;
  final String? title;
  const CustomCardType2({Key? key, required this.imageUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(children:  [
         FadeInImage(
          image: NetworkImage(
              imageUrl),
          placeholder: const AssetImage('assets/jar-loading.gif'),
          width: double.infinity,
          height: 240,
          fit: BoxFit.contain,
        ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsets.only(right: 10,top: 15,bottom: 15),
          child: Text(title ?? 'No Title'),
        ),

        // if(title != null)
        //  Container(
        //   alignment: AlignmentDirectional.centerEnd,
        //   padding: const EdgeInsets.only(right: 10,top: 15,bottom: 15),
        //   child: Text(title!),
        // ),
      ]),
    );
  }
}
