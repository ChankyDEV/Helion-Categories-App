import 'package:dartz/dartz.dart';
import 'package:helion/models/category.dart';
import 'package:helion/models/failures.dart';

abstract class CategoryService {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
