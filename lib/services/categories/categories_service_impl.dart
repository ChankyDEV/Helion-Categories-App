import 'package:dartz/dartz.dart';
import 'package:helion/models/category.dart';
import 'package:helion/models/category_exception.dart';
import 'package:helion/models/failures.dart';
import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:helion/services/categories/categories_service.dart';
import 'package:helion/services/network/network_connection_service.dart';
import 'package:helion/utils/consts.dart';

class CategoriesServiceImpl implements CategoriesService {
  final CategoriesRepository _repository;
  final NetworkConnectionService _networkConnectionService;

  CategoriesServiceImpl(
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
