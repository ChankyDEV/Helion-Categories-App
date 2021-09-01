import 'dart:convert';
import 'dart:io';

import 'package:helion/models/category_dto.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:http/http.dart' as http;

class CategoryRepositoryImpl implements CategoryRepository {
  final http.Client _client;

  final url = Uri.parse('https://helion.pl/rest.helion.pl/categories');
  final headers = {HttpHeaders.contentTypeHeader: "application/json"};

  CategoryRepositoryImpl(this._client);

  @override
  Future<List<CategoryDTO>> getAllCategories() async {
    final response = await _client.get(url, headers: headers);
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
    }
    return Future.value([]);
  }
}
