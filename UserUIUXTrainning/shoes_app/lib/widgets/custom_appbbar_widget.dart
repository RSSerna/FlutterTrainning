import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({Key? key, required this.texto}) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          // height: 150,
          // color: Colors.blueGrey,
          child: Row(
            // Spacer funciona o el mainAxis tambien
            // mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children:  [
              Text(
                texto,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              const Icon(
                Icons.search,
                size: 30,
              )
            ],
          )),
    );
  }
}
