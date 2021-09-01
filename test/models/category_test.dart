import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:helion/models/category_dto.dart';

import '../utils/fixtures/fixture_reader.dart';

void main() {
  final tCategory = CategoryDTO(0, 'Promocja', '68297', <CategoryDTO>[
    CategoryDTO(319, 'Militaria. Technika wojskowa', '215', <CategoryDTO>[]),
    CategoryDTO(305, 'Instalacje elektryczne', '32', <CategoryDTO>[])
  ]);

  final tCategoryWithoutSubcategory = CategoryDTO(
    0,
    'Promocja',
    '68297',
    <CategoryDTO>[],
  );

  test('should convert json to categoryDTO', () {
    final Map<String, dynamic> jsonMap = json.decode(
      fixture('category.json'),
    );

    final category = CategoryDTO.fromJson(jsonMap);

    expect(
      category,
      tCategory,
    );
  });

  test(
      'should convert json to categoryDTO if category dont have sub categories',
      () {
    final Map<String, dynamic> jsonMap = json.decode(
      fixture('categoriesWithoutSubcategory.json'),
    );

    final category = CategoryDTO.fromJson(jsonMap);

    expect(
      category,
      tCategoryWithoutSubcategory,
    );
  });
}
