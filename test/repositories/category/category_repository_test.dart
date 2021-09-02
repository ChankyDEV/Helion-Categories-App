import 'dart:io';

import 'package:enough_convert/enough_convert.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helion/models/category_dto.dart';
import 'package:helion/models/category_exception.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:helion/repositories/category/category_repository_impl.dart';
import 'package:helion/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../utils/fixtures/fixture_reader.dart';
import '../../utils/mock_http_client.dart';

void main() {
  late final CategoryRepository repository;
  late final http.Client client;
  final url = Uri.parse('https://helion.pl/rest.helion.pl/categories');
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  };
  final tCategories = <CategoryDTO>[
    CategoryDTO(0, 'Promocja', '65135', <CategoryDTO>[]),
    CategoryDTO(285, 'Technika i mechanika', '933', <CategoryDTO>[
      CategoryDTO(
        319,
        'Militaria. Technika wojskowa',
        '215',
        <CategoryDTO>[],
      ),
    ]),
    CategoryDTO(39, 'Edukacja', '2259', <CategoryDTO>[
      CategoryDTO(
        243,
        'Szkoły zawodowe i technika',
        '15',
        <CategoryDTO>[],
      ),
    ]),
  ];

  setUpAll(() {
    client = MockHttpClient();
    repository = CategoryRepositoryImpl(client);
  });

  test('should perform a call to particular url', () async {
    when(client.get(url, headers: anyNamed('headers'))).thenAnswer(
      (_) async =>
          http.Response(fixture('categories.json'), 200, headers: headers),
    );
    await repository.getAllCategories();
    verify(
      client.get(
        url,
        headers: headers,
      ),
    );
  });

  test('should return list of categories if status code is 200', () async {
    when(client.get(url, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('categories.json'), 200,
          headers: headers),
    );

    final categories = await repository.getAllCategories();

    verify(
      client.get(
        url,
        headers: headers,
      ),
    );
    expect(
      categories,
      tCategories,
    );
  });

  test('should throw categories exception if status code is different than 200',
      () async {
    when(client.get(url, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('', 400, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      }),
    );
    final call = repository.getAllCategories;

    expect(
      () => call(),
      throwsA(CategoryException(WRONG_STATUS_CODE)),
    );
  });
}
