import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/shoe_model.dart';

class ShoeSizeWidget extends StatelessWidget {
  const ShoeSizeWidget({Key? key, this.fullScreen = false}) : super(key: key);
  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: fullScreen
          ? const EdgeInsetsDirectional.all(5)
          : const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: const Color(0xffFFcf53),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            const _ShoeWithShadow(),
            if (!fullScreen) const _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _SizeSquare(
            numero: 7.0,
          ),
          _SizeSquare(
            numero: 7.5,
          ),
          _SizeSquare(
            numero: 8.0,
          ),
          _SizeSquare(
            numero: 8.5,
          ),
          _SizeSquare(
            numero: 9.0,
          ),
          _SizeSquare(
            numero: 9.5,
          ),
        ],
      ),
    );
  }
}

class _SizeSquare extends StatelessWidget {
  final double numero;
  const _SizeSquare({
    Key? key,
    required this.numero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () => shoeModel.talla = numero,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: numero == shoeModel.talla ? Colors.yellow[800] : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              if (numero == shoeModel.talla)
                const BoxShadow(
                    blurRadius: 10, color: Colors.black45, offset: Offset(0, 5))
            ]),
        child: Center(
            child: Text(
          numero.toString().replaceAll('.0', ''),
          
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: numero == shoeModel.talla ? Colors.white : Colors.yellow[900],
          ),
        )),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String imagen = Provider.of<ShoeModel>(context).assetImag;
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children:  [
          const Positioned(bottom: 20, right: 0, child: _ShoeShadow()),
          Image(image: AssetImage(imagen))
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            // color: Colors.pink,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)
            ]),
      ),
    );
  }
}
