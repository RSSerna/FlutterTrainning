
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? counterText;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? isNumber;

  final String formProperty;
  final Map<String,dynamic> formValues;

  
  const CustomInputField({
    Key? key, 
    this.hintText, 
    this.labelText, 
    this.helperText,
    this.counterText, 
    this.icon, 
    this.suffixIcon,  
    this.prefixIcon, 
    this.textInputType, 
    this.obscureText = false, 
    required this.formProperty, 
    required this.formValues, 
     this.isNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      autofocus: false,
      obscureText: obscureText!,
      initialValue: formValues[formProperty].toString(),
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        formValues[formProperty] = value;
        // print(value);

      },
      validator: (value) {
        if (value==null) return 'Campo requerido';
        if (isNumber != null) 
        {
          return double.tryParse(value) == null ? 'Es necesario un numero' : null; 
        }
        return null;
        // return value.length < 5 ? 'Minimo 5 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:  InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: counterText,
        prefixIcon: prefixIcon == null? null: Icon(prefixIcon),
        suffixIcon: suffixIcon == null? null: Icon(suffixIcon),
        icon: icon == null? null:Icon(icon),
      ),
    );
  }
}