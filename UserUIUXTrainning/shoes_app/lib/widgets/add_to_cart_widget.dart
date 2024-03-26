import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/widgets.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({Key? key, required this.monto}) : super(key: key);

  final double monto;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                '\$$monto',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const Spacer(),
              const BotonNaranjaWidget(texto: 'Prueba',height: 50, width: 150,)
            ],
          )),
    );
  }
}
