import 'package:helion/models/category.dart';

class CategoryDTO extends Category {
  CategoryDTO(
    int id,
    String name,
    String booksAmount,
    List<CategoryDTO> subcategories,
  ) : super(id, name, booksAmount, subcategories);

  factory CategoryDTO.fromJson(Map<String, dynamic> jsonMap) {
    return CategoryDTO(
      jsonMap['id'],
      jsonMap['name'],
      _booksAmountFromJson(jsonMap['books']),
      _convertChildren(jsonMap['children']),
    );
  }
}

String _booksAmountFromJson(dynamic booksAmount) {
  return booksAmount.toString();
}

List<CategoryDTO> _convertChildren(List<dynamic>? children) {
  if (children != null) {
    final subCategories = <CategoryDTO>[];
    children.forEach((subcategoryMap) {
      subCategories.add(
        CategoryDTO.fromJson(subcategoryMap),
      );
    });
    return subCategories;
  } else {
    return <CategoryDTO>[];
  }
}
