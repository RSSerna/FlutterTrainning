import 'package:flutter/material.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/screens/screens.dart';

import 'package:shoes_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    changeStatusDark();

    return Scaffold(
      // body: Center(child: ShoeSizeWidget()),
      // body: CustomAppbarWidget(texto: 'For you',),
      body: Column(children: [
        const CustomAppbarWidget(
          texto: 'For you',
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ShoeDescriptionScreen.routeName);
                  },
                  child: const Hero(tag: 'shoe', child: ShoeSizeWidget())),
              const ShoeDescriptionWidget(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
            ],
          ),
        )),
        const AddToCartWidget(
          monto: 180.0,
        )
      ]),
    );
  }
}
