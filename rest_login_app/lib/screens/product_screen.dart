import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rest_login_app/UI/input_decorations.dart';
import 'package:rest_login_app/providers/product_form_provider.dart';

import '../services/services.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = 'Product';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          ProductFormProvider(productService.selectedProduct!),
      child: _ProductScaffold(productService: productService),
    );
  }
}

class _ProductScaffold extends StatelessWidget {
  const _ProductScaffold({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              _ProductImage(
                img: productService.selectedProduct?.picture,
              ),
              Positioned(
                top: 50,
                left: 30,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                top: 50,
                right: 30,
                child: productService.isSaving
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: productService.isSaving
                            ? null
                            : () async {
                                final picker = ImagePicker();
                                final PickedFile? pickedFile = await picker
                                    .getImage(source: ImageSource.gallery
                                        // source: ImageSource.camera
                                        );
                                // await picker.

                                if (pickedFile == null) {
                                  print('No select');
                                  return;
                                }

                                productService.updateSelectedProductImage(
                                    pickedFile.path);
                              },
                      ),
              ),
            ],
          ),
          _ProductForm(),
          const SizedBox(
            height: 100,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () async {
            // final productForm = Provider.of<ProductFormProvider>(context, listen: false);
            if (!productForm.isValidForm()) return;

            final String? imageUrl = await productService.uploadImage();

            if (imageUrl != null) productForm.productModel.picture = imageUrl;

            await productService
                .createOrUpdateProduct(productForm.productModel);
          }),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.productModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        // height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: product.name,
                onChanged: ((value) => product.name = value),
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return 'Se necesita un dato';
                  }

                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                    'Nombre',
                    'Nombre del producto',
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: product.price.toString(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  product.price = double.tryParse(value) == null
                      ? 0
                      : double.tryParse(value)!;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    '\$150',
                    'Precio',
                    const Icon(
                      Icons.price_change,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                  title: const Text('Disponible'),
                  value: product.available,
                  onChanged: (value) {
                    productForm.updateAvailable(value);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? img;

  const _ProductImage({super.key, this.img});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
          width: double.infinity,
          height: 450,
          decoration: _boxDecorationImg(),
          child: Opacity(
            opacity: 0.9,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(45), topLeft: Radius.circular(45)),
              child: _ImgPlaceholder(img: img),
            ),
          )),
    );
  }

  BoxDecoration _boxDecorationImg() => const BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(45), topLeft: Radius.circular(45)),
      color: Colors.black,
      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 15)]);
}

class _ImgPlaceholder extends StatelessWidget {
  const _ImgPlaceholder({
    Key? key,
    required this.img,
  }) : super(key: key);

  final String? img;

  @override
  Widget build(BuildContext context) {
    if (img == null || !img!.isNotEmpty) {
      return const Image(
        image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
      );
    }
    if (img!.startsWith('http')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(img!),
        fit: BoxFit.contain,
      );
    }
    // print('path');
    return Image.file(
      File(img!),
      fit: BoxFit.cover,
    );
  }
}
