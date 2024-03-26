// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:api_app/models/models.dart';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
  });

  int id;
  List<Cast> cast;

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        // crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "id": id,
  //     "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
  // };
}

