// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';

import 'package:cleanarquitecture_numbers_app/core/error/exceptions.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/data/datasources/number_trivia_remote_data_source.dart';
import 'package:cleanarquitecture_numbers_app/features/ca_number/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:matcher/matcher.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';

// class MockHttpClient extends Mock implements http.Client {}

@GenerateNiceMocks([MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late NumberTriviaRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200(Uri uri) {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('trivia.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404(Uri uri) {
    when(mockHttpClient.get(uri, headers: {'Content-Type': 'application/json'})).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('getConcreteNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    const tNumber = 1;
    Uri uri = Uri.parse('http://numbersapi.com/$tNumber');

    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
      () {
        //arrange
        setUpMockHttpClientSuccess200(uri);
        // act
        dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockHttpClient.get(
          uri,
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(uri);
        // act
        final result = await dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404(uri);
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(
            () => call(tNumber), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

    group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    Uri uri = Uri.http('numbersapi.com', '/random');
    // Uri uri = Uri.parse('http://numbersapi.com/random');

    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
      () {
        //arrange
        setUpMockHttpClientSuccess200(uri);
        // act
        dataSource.getRandomNumberTrivia();
        // assert
        verify(mockHttpClient.get(
          uri,
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(uri);
        // act
        final result = await dataSource.getRandomNumberTrivia();
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404(uri);
        // act
        final call = dataSource.getRandomNumberTrivia;
        // assert
        expect(
            () => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });


}
