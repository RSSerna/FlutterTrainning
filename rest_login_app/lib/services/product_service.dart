import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rest_login_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-43d40-default-rtdb.firebaseio.com';
  final List<ProductModel> products = [];
  bool isLoading = true;
  bool isSaving = false;

  ProductModel? selectedProduct;

  File? newPictureFile;

  final storage = FlutterSecureStorage();

  ProductService() {
    loadProducts();
  }

  // Future<List<ProductModel>>
  Future loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json',
    {
      'auth':await storage.read(key: 'key') ?? '',
    });
    final resp = await http.get(url);
    final Map<String, dynamic> productMap = json.decode(resp.body);

    productMap.forEach((key, value) {
      final tempProduct = ProductModel.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
  }

  Future createOrUpdateProduct(ProductModel productModel) async {
    isSaving = true;
    notifyListeners();

    if (productModel.id == null) {
      await _createProduct(productModel);
    } else {
      await _updateProduct(productModel);
    }

    isSaving = false;
    notifyListeners();
  }

  Future _updateProduct(ProductModel productModel) async {
    final url = Uri.https(_baseUrl, 'products/${productModel.id}.json',{
      'auth':await storage.read(key: 'key') ?? '',
    });
    final resp = await http.put(url, body: productModel.toJson());

    //TODO: Actulizar
    products[products.indexWhere((element) => element.id == productModel.id)] =
        productModel;
  }

  Future _createProduct(ProductModel productModel) async {
    final url = Uri.https(_baseUrl, 'products.json',{
      'auth':await storage.read(key: 'key') ?? '',
    });
    final resp = await http.post(url, body: productModel.toJson());

    productModel.id = json.decode(resp.body)['name'];

    products.add(productModel);
  }

  void updateSelectedProductImage(String path) {
    selectedProduct!.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future uploadImage() async {
    if (newPictureFile == null) return;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dd6t1cyzz/image/upload?upload_preset=egoiza4b_1');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if(resp.statusCode != 200 && resp.statusCode != 201)
    {
      print('Algo malio sal');
      return null;
    }

    newPictureFile = null;

    isSaving = false;
    notifyListeners();

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
