import 'package:dartz/dartz.dart';
import 'package:helion/models/category.dart';
import 'package:helion/models/category_exception.dart';
import 'package:helion/models/failures.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:helion/services/category/category_service.dart';
import 'package:helion/core/network/network_connection_service.dart';
import 'package:helion/utils/consts.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepository _repository;
  final NetworkConnectionChecker _networkConnectionService;

  CategoryServiceImpl(
    this._repository,
    this._networkConnectionService,
  );

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final isUserConnected = await _networkConnectionService.isConnected;
      if (isUserConnected) {
        final categories = await _repository.getAllCategories();
        return right(categories);
      }
      return left(Failure(NO_INTERNET_CONNECTION));
    } on CategoryException catch (e) {
      return left(Failure(e.message));
    }
  }
}
