import 'package:helion/models/category_dto.dart';

abstract class CategoriesRepository {
  Future<List<CategoryDTO>> getAllCategories();
}
