part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class NewApiResponseEvent extends ApiEvent {
  final ApiResponse apiResponse;
  NewApiResponseEvent(this.apiResponse);
}

class ModifyApiResponseEvent extends ApiEvent {
  final ApiResponse apiResponse;
  ModifyApiResponseEvent(this.apiResponse);
}

class SearchApiResponseEvent extends ApiEvent{
  final String date;

  SearchApiResponseEvent(this.date);
}
