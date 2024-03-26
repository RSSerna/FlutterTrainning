part of 'api_bloc.dart';

@immutable
abstract class ApiState {
  final ApiResponse apiResponse;

  const ApiState({required this.apiResponse});
}

class ApiInitialState extends ApiState {
  ApiInitialState()
      : super(
            apiResponse: ApiResponse(
          formattedDate: "No",
          dailySummary: "DailySummary",
          temperature: 1.0,
          pressure: 1.0,
          windBearing: 1.0,
          visibility: 1.0,
          precipitationType: "PrecipitationType",
          humidity: 1.0,
          windSpeed: 1.0,
          loudCover: 1.0,
          summary: "Summary",
          apparentTemperatur: 1.0,
        ));
}

class ApiSetState extends ApiState {
  final ApiResponse apiResponseNew;

  const ApiSetState({required this.apiResponseNew})
      : super(apiResponse: apiResponseNew);
}
