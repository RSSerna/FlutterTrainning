import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/models/shoe_model.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ShoeDescriptionScreen extends StatelessWidget {
  static const String routeName = 'ShoeDescription';

  const ShoeDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            const Hero(
              tag: 'shoe',
              child: ShoeSizeWidget(
                fullScreen: true,
              ),
            ),
            SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_left_rounded,
                    size: 50,
                  )),
            )
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: const [
              ShoeDescriptionWidget(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _MontoBuyNow(),
              _ColorsAndMore(),
              _BottomButtoms()
            ],
          ),
        ))
      ],
    ));
  }
}

class _BottomButtoms extends StatelessWidget {
  const _BottomButtoms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _IconButtom(
            icon: Icon(Icons.star),
          ),
          _IconButtom(
            icon: Icon(Icons.shop),
          ),
          _IconButtom(
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

class _IconButtom extends StatelessWidget {
  const _IconButtom({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)]),
      child: icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(
                left: 90,
                child: _ColorButtom(
                  color: Colors.green,
                  index: 1,
                  imgAsset: 'assets/verde.png',
                ),
              ),
              Positioned(
                left: 60,
                child: _ColorButtom(
                  color: Colors.yellow,
                  index: 2,
                  imgAsset: 'assets/amarillo.png',
                ),
              ),
              Positioned(
                left: 30,
                child: _ColorButtom(
                  color: Colors.blue,
                  index: 3,
                  imgAsset: 'assets/azul.png',
                ),
              ),
              _ColorButtom(
                color: Colors.black,
                index: 4,
                imgAsset: 'assets/negro.png',
              ),
            ],
          )),
          // const Spacer(),
          const BotonNaranjaWidget(
            height: 25,
            width: 120,
            texto: 'Texto',
            color: Colors.orangeAccent,
          )
        ],
      ),
    );
  }
}

class _ColorButtom extends StatelessWidget {
  const _ColorButtom({
    Key? key,
    required this.color,
    this.index = 1,
    required this.imgAsset,
  }) : super(key: key);
  final Color color;
  final int index;
  final String imgAsset;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 150),
      child: GestureDetector(
        onTap: () =>
            Provider.of<ShoeModel>(context, listen: false).assetImag = imgAsset,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Row(
        children: const [
          Text(
            '\$180.0',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          BotonNaranjaWidget(
            texto: 'Buy Now',
            height: 40,
            width: 100,
          )
        ],
      ),
    );
  }
}
