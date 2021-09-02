import 'package:get_it/get_it.dart';
import 'package:helion/blocs/category/category_bloc.dart';
import 'package:helion/core/network/network_connection_service.dart';
import 'package:helion/core/network/network_connection_service_impl.dart';
import 'package:helion/repositories/category/category_repository.dart';
import 'package:helion/repositories/category/category_repository_impl.dart';
import 'package:helion/services/category/category_service.dart';
import 'package:helion/services/category/category_service_impl.dart';
import 'package:helion/services/routing/routing_service.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Config {
  final GetIt getIt = GetIt.instance;

  Future<void> configureDependencies() async {
    getIt
      ..registerSingleton<RoutingService>(RoutingService())
      ..registerSingleton<CategoryRepository>(
        CategoryRepositoryImpl(
          http.Client(),
        ),
      )
      ..registerSingleton<NetworkConnectionChecker>(
        NetworkConnectionCheckerImpl(
          InternetConnectionChecker(),
        ),
      )
      ..registerSingleton<CategoryService>(
        CategoryServiceImpl(
          getIt.get<CategoryRepository>(),
          getIt.get<NetworkConnectionChecker>(),
        ),
      )
      ..registerSingleton<CategoryBloc>(
        CategoryBloc(
          getIt.get<CategoryService>(),
          getIt.get<NetworkConnectionChecker>(),
        ),
      );
  }
}
