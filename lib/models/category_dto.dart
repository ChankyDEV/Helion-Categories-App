import 'package:helion/models/category.dart';

class CategoryDTO extends Category {
  CategoryDTO(
    int id,
    String name,
    String booksAmount,
    List<Category> subcategories,
  ) : super(
          id,
          name,
          booksAmount,
          subcategories,
        );
}
