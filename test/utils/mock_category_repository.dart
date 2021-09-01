import 'package:helion/models/category.dart';
import 'package:helion/models/category_dto.dart';
import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoriesRepository {
  @override
  Future<List<CategoryDTO>> getAllCategories() async {
    return super.noSuchMethod(
      Invocation.method(#getUser, null),
      returnValueForMissingStub: Future.value(<CategoryDTO>[]),
      returnValue: Future.value(<CategoryDTO>[]),
    );
  }
}
