// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:api_app/models/models.dart';

class CreditsResponseModel {
  CreditsResponseModel({
    required this.id,
    required this.cast,
  });

  int id;
  List<Cast> cast;

  factory CreditsResponseModel.fromJson(String str) =>
      CreditsResponseModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory CreditsResponseModel.fromMap(Map<String, dynamic> json) => CreditsResponseModel(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        // crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "id": id,
  //     "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
  // };
}

