import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable
{
  final List<dynamic> properties;

  const Failure({ required this.properties});

  @override
  List<Object?> get props => properties;
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({required super.properties});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.properties});
}