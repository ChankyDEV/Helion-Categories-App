import 'dart:convert';
import 'dart:io';

import 'package:helion/models/category_dto.dart';
import 'package:helion/models/exceptions.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:helion/utils/consts.dart';
import 'package:http/http.dart' as http;

import '../../core/extensions.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final http.Client _client;

  final url = Uri.parse('https://helion.pl/rest.helion.pl/categories');
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
  };

  CategoryRepositoryImpl(this._client);

  @override
  Future<List<CategoryDTO>> getAllCategories() async {
    final response = await _client.get(url, headers: headers);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body.toLatin2());
      final categoriesMap = responseJson['categories'] as List<dynamic>;
      final categories = <CategoryDTO>[];
      categoriesMap.forEach((categoryJson) {
        categories.add(
          CategoryDTO.fromJson(categoryJson),
        );
      });
      return categories;
    }
    throw CategoryException(WRONG_STATUS_CODE);
  }
}
