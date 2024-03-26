import 'dart:convert';

class ApiResponse {
  ApiResponse({
    required this.formattedDate,
    required this.dailySummary,
    required this.temperature,
    required this.pressure,
    required this.windBearing,
    required this.visibility,
    required this.precipitationType,
    required this.humidity,
    required this.windSpeed,
    required this.loudCover,
    required this.summary,
    required this.apparentTemperatur,
  });

  String formattedDate;
  String dailySummary;
  double temperature;
  double pressure;
  double windBearing;
  double visibility;
  String precipitationType;
  double humidity;
  double windSpeed;
  double loudCover;
  String summary;
  double apparentTemperatur;

  factory ApiResponse.fromJson(String str) =>
      ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromAnyMap(Map<String, dynamic> json) => ApiResponse(
        formattedDate: json["FormattedDate"],
        dailySummary: json["DailySummary"],
        temperature: double.parse(json["Temperature"].toString()),
        pressure: double.parse(json["Pressure"].toString()),
        windBearing: double.parse(json["WindBearing"].toString()),
        visibility: double.parse(json["Visibility"].toString()),
        precipitationType: json["PrecipitationType"],
        humidity: double.parse(json["Humidity"].toString()),
        windSpeed: double.parse(json["WindSpeed"].toString()),
        loudCover: double.parse(json["LoudCover"].toString()),
        summary: json["Summary"],
        apparentTemperatur: double.parse(json["ApparentTemperatur"].toString()),
      );

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
        // formattedDate: DateTime.parse(json["FormattedDate"]),
        formattedDate: json["FormattedDate"],
        dailySummary: json["DailySummary"],
        temperature: json["Temperature"],
        pressure: json["Pressure"].toDouble(),
        windBearing: json["WindBearing"],
        visibility: json["Visibility"].toDouble(),
        precipitationType: json["PrecipitationType"],
        humidity: json["Humidity"].toDouble(),
        windSpeed: json["WindSpeed"].toDouble(),
        loudCover: json["LoudCover"],
        summary: json["Summary"],
        apparentTemperatur: json["ApparentTemperatur"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        // "FormattedDate": formattedDate.toIso8601String(),
        "FormattedDate": formattedDate,
        "DailySummary": dailySummary,
        "Temperature": temperature,
        "Pressure": pressure,
        "WindBearing": windBearing,
        "Visibility": visibility,
        "PrecipitationType": precipitationType,
        "Humidity": humidity,
        "WindSpeed": windSpeed,
        "LoudCover": loudCover,
        "Summary": summary,
        "ApparentTemperatur": apparentTemperatur,
      };
}
