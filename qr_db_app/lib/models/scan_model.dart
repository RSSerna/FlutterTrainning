// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }){
    tipo = valor.contains('http') ? 'http' : 'geo'; 
  }

  int? id;
  String? tipo;
  String valor;

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
