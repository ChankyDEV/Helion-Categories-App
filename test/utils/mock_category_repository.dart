import 'package:helion/models/category_dto.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {
  @override
  Future<List<CategoryDTO>> getAllCategories() async {
    return super.noSuchMethod(
      Invocation.method(#getAllCategories, null),
      returnValueForMissingStub: Future.value(<CategoryDTO>[]),
      returnValue: Future.value(<CategoryDTO>[]),
    );
  }
}
