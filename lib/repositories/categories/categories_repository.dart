import 'package:helion/models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getAllCategories();
}
