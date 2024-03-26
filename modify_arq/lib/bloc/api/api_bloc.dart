// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'package:formulario_arq/model/api_response.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final String _baseUrl = 'cros-anywhere.herokuapp.com';

  ApiBloc() : super(ApiInitialState()) {
    on<NewApiResponseEvent>((event, emit) async {
      DateTime dateTime = DateTime.now();
      dateTime =
          dateTime.subtract(Duration(milliseconds: dateTime.millisecond));
      dateTime =
          dateTime.subtract(Duration(microseconds: dateTime.microsecond));
      dateTime = dateTime.subtract(Duration(seconds: dateTime.second));
      event.apiResponse.formattedDate = DateTime.now().toString();
      emit(ApiSetState(apiResponseNew: event.apiResponse));
      final jsonData = await _postJsonData(
          endPoint: '/34.125.228.122:8000/weather-api-create', apiResponse: event.apiResponse);
      // final getApiInfo = ApiResponse.fromJson(jsonData);
      // emit(ApiSetState(apiResponseNew: getApiInfo));
    });

    on<ModifyApiResponseEvent>((event, emit) async {
      emit(ApiSetState(apiResponseNew: event.apiResponse));
      final jsonData = await _updatePostJsonData(
          endPoint: '/34.125.228.122:8000/weather-api-update', apiResponse: event.apiResponse);
    });

    on<SearchApiResponseEvent>((event, emit) async {
      print(event.date);
      try {
        final encodedDate = event.date.toString();
        final jsonData = await _getJsonData(
            endPoint: '/34.125.228.122:8000/weather-api-read', formattedDate: encodedDate);
        final getApiInfo = ApiResponse.fromJson(jsonData);
        print('Aqui va la info $getApiInfo');
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
      'Access-Control-Allow-Origin': '*',
      'origin': 'arqmodifyflutter.tk'
    });

    final response = await http.get(url);
    return response.body;
  }

  Future<String> _postJsonData(
      {required String endPoint, required ApiResponse apiResponse}) async {
    print('el pepe2');
    final url = Uri.http(_baseUrl, endPoint, {
      'date': apiResponse.formattedDate.toString(),
      'aptem': apiResponse.apparentTemperatur.toString(),
      'ds': apiResponse.dailySummary.toString(),
      'hum': apiResponse.humidity.toString(),
      'lc': apiResponse.loudCover.toString(),
      'precp': apiResponse.precipitationType.toString(),
      'press': apiResponse.pressure.toString(),
      'sum': apiResponse.summary.toString(),
      'temp': apiResponse.temperature.toString(),
      'vis': apiResponse.visibility.toString(),
      'wb': apiResponse.windBearing.toString(),
      'ws': apiResponse.windSpeed.toString(),
      'Access-Control-Allow-Origin': '*',
      'origin': 'arqmodifyflutter.tk'
    });
    final response = await http.post(url);
    print(response.body);
    return response.body;
  }

  Future<String> _updatePostJsonData(
      {required String endPoint, required ApiResponse apiResponse}) async {
    print('el pepe');
    final url = Uri.http(_baseUrl, endPoint, {
      'date': apiResponse.formattedDate.toString(),
      'aptem': apiResponse.apparentTemperatur.toString(),
      'ds': apiResponse.dailySummary.toString(),
      'hum': apiResponse.humidity.toString(),
      'lc': apiResponse.loudCover.toString(),
      'precp': apiResponse.precipitationType.toString(),
      'press': apiResponse.pressure.toString(),
      'sum': apiResponse.summary.toString(),
      'temp': apiResponse.temperature.toString(),
      'vis': apiResponse.visibility.toString(),
      'wb': apiResponse.windBearing.toString(),
      'ws': apiResponse.windSpeed.toString(),
      'Access-Control-Allow-Origin': '*',
      'origin': 'arqmodifyflutter.tk'
    });
    final response = await http.post(url);
    print(response.body);
    return response.body;
  }
}
