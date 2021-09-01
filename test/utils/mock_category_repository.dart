import 'package:helion/models/category.dart';
import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoriesRepository {
  @override
  Future<List<Category>> getAllCategories() async {
    return super.noSuchMethod(
      Invocation.method(#getUser, null),
      returnValueForMissingStub: Future.value(<Category>[]),
      returnValue: Future.value(<Category>[]),
    );
  }
}
