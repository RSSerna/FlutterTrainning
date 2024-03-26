import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_login_app/models/models.dart';
import 'package:rest_login_app/screens/screens.dart';
import 'package:rest_login_app/services/services.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        leading: IconButton(
            onPressed: () {
              final authService =
                  Provider.of<AuthService>(context, listen: false);
              authService.logout();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(Icons.logout)),
      ),
      body: productService.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            )
          : ListView.builder(
              itemCount: productService.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: (() {
                      productService.selectedProduct =
                          productService.products[index].copy();
                      Navigator.pushNamed(context, ProductScreen.routeName);
                    }),
                    child: ProductCard(
                      productModel: productService.products[index],
                    ));
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.selectedProduct = ProductModel(
            available: false,
            name: '',
            price: 0,
          );
          Navigator.pushNamed(context, ProductScreen.routeName);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10)]),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          _BackgroundImage(
            imgUrl: productModel.picture,
          ),
          _ProductDetails(
            id: productModel.id!,
            name: productModel.name,
          ),
          Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(
                price: productModel.price.toString(),
              )),
          if (!productModel.available)
            Positioned(top: 0, left: 0, child: _AvailableTag()),
        ],
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final String price;

  const _PriceTag({super.key, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      alignment: Alignment.center,
      decoration: _BoxDecorationProduct.boxDecorationProduct(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$ $price',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _AvailableTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String name;
  final String id;

  const _ProductDetails({super.key, required this.name, required this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _BoxDecorationProduct.boxDecorationProduct(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _BoxDecorationProduct {
  static BoxDecoration boxDecorationProduct() {
    return const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? imgUrl;

  const _BackgroundImage({super.key, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: imgUrl == null || !imgUrl!.isNotEmpty
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(imgUrl!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
