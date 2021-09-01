import 'package:dartz/dartz.dart';
import 'package:helion/models/category.dart';
import 'package:helion/models/failures.dart';

abstract class CategoriesService {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
