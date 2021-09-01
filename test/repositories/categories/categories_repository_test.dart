import 'package:flutter_test/flutter_test.dart';
import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:helion/repositories/categories/categories_repository_impl.dart';
import 'package:helion/services/categories/categories_service.dart';
import 'package:helion/services/categories/categories_service_impl.dart';
import 'package:helion/services/network/network_connection_service.dart';
import 'package:helion/services/network/network_connection_service_impl.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  late final CategoriesRepository repository;
  late final CategoriesService categoriesService;
  late final NetworkConnectionService networkConnectionService;

  setUpAll(() {
    final client = http.Client();
    final internetConnectionChecker = InternetConnectionChecker();
    repository = CategoriesRepositoryImpl(client);
    networkConnectionService = NetworkConnectionServiceImpl(
      internetConnectionChecker,
    );
    categoriesService = CategoriesServiceImpl(repository);
  });
}
