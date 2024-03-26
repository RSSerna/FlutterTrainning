import 'package:cleanarquitecture_numbers_app/core/network/network_info.dart';
import 'package:cleanarquitecture_numbers_app/core/util/input_converter.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/data/datasources/number_trivia_local_data_source.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/data/datasources/number_trivia_remote_data_source.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/data/repositories/number_trivia_repository_impl.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/repositories/number_trivia_repository.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_concrete_number_trivia.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/domain/usecases/get_random_number_trivia.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'features/ca_number/presentation/bloc/numbert_trivia_bloc.dart';


// import 'package:data_connection_checker/data_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  //Bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      getConcreteNumberTrivia: sl(),
      getRandomNumberTrivia: sl(),
      inputConverter: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core

  sl.registerLazySingleton(() => InputConverter());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
 
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
