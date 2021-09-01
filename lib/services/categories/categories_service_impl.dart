import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:helion/services/categories/categories_service.dart';

class CategoriesServiceImpl implements CategoriesService {
  final CategoriesRepository _repository;

  CategoriesServiceImpl(this._repository);
}
