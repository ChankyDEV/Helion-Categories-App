import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:http/http.dart' as http;

class CategoriesRepositoryImpl implements CategoriesRepository {
  final http.Client _client;

  CategoriesRepositoryImpl(this._client);
}
