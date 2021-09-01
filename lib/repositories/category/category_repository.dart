import 'package:helion/models/category_dto.dart';

abstract class CategoryRepository {
  Future<List<CategoryDTO>> getAllCategories();
}
