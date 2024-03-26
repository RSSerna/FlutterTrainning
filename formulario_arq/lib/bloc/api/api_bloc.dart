// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'package:formulario_arq/model/api_response.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final String _baseUrl = '34.125.228.122:8000';

  ApiBloc() : super(ApiInitialState()) {
    on<NewApiResponseEvent>((event, emit) async {
      DateTime dateTime = DateTime.now();
      dateTime =
          dateTime.subtract(Duration(milliseconds: dateTime.millisecond));
      dateTime =
          dateTime.subtract(Duration(microseconds: dateTime.microsecond));
      dateTime = dateTime.subtract(Duration(seconds: dateTime.second));
      event.apiResponse.formattedDate = dateTime.toString();
      emit(ApiSetState(apiResponseNew: event.apiResponse));

      // try {
      // final jsonData = await _postJsonData(
      //     endPoint: '/weather-api', apiResponse: event.apiResponse.toMap());
      //   // final encodedDate = event.date.toString();
      //   final getApiInfo = ApiResponse.fromJson(jsonData);
      //   // print('Aqui va la info $apiInfo');
      //   emit(ApiSetState(apiResponseNew: getApiInfo));
      // } catch (e) {
      //   print(e.toString());
      // }
    });
    on<ModifyApiResponseEvent>((event, emit) {
      emit(ApiSetState(apiResponseNew: event.apiResponse));

      //TODO: Logica New ApiResponse
    });

    on<SearchApiResponseEvent>((event, emit) async {
      print(event.date);
      //TODO; buscar en el JSON la info
      try {
        final encodedDate = event.date.toString();
        final jsonData = await _getJsonData(
            endPoint: '/weather-api', formattedDate: encodedDate);
        final getApiInfo = ApiResponse.fromJson(jsonData);
        // print('Aqui va la info $apiInfo');
        emit(ApiSetState(apiResponseNew: getApiInfo));
      } catch (e) {
        print(e);
      }
    });
  }

  // ignore: unused_element
  Future<String> _getJsonData(
      {required String endPoint, required String formattedDate}) async {
    final url = Uri.http(_baseUrl, endPoint, {
      'date': formattedDate,
    });
    final response = await http.get(url);
    return response.body;
  }

  Future<String> _postJsonData(
      {required String endPoint,
      required Map<String, dynamic> apiResponse}) async {
    Map<String, dynamic> queryParameters = {
      'aptem': apiResponse['ApparentTemperatur'].toString(),
      'ds': apiResponse['DailySummary'].toString(),
      'hum': apiResponse['Humidity'].toString(),
      'lc': apiResponse['LoudCover'].toString(),
      'precp': apiResponse['PrecipitationType'].toString(),
      'press': apiResponse['Pressure'].toString(),
      'sum': apiResponse['Summary'].toString(),
      'temp': apiResponse['Temperature'].toString(),
      'vis': apiResponse['Visibility'].toString(),
      'wb': apiResponse['WindBearing'].toString(),
      'ws': apiResponse['WindSpeed'].toString(),
    };
    final url = Uri.http(_baseUrl, endPoint, queryParameters);
    final response = await http.get(url);
    return response.body;
  }
}
