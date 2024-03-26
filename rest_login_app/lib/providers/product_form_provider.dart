import 'package:flutter/material.dart';
import 'package:rest_login_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  ProductModel productModel;

  ProductFormProvider(this.productModel);

  updateAvailable(bool value)
  {
    productModel.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
