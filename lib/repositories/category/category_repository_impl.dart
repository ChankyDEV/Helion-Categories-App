import 'package:helion/models/category_dto.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:http/http.dart' as http;

class CategoryRepositoryImpl implements CategoryRepository {
  final http.Client _client;

  CategoryRepositoryImpl(this._client);

  @override
  Future<List<CategoryDTO>> getAllCategories() {
    return Future.value([]);
  }
}
