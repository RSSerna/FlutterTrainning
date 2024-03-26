import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      String hintText, String labelText, Icon prefixIcon) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.purple),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple,
          width: 2,
        ),
      ),
    );
  }
}
