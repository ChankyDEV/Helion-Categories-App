import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helion/models/category.dart';
import 'package:helion/models/category_exception.dart';
import 'package:helion/models/failures.dart';
import 'package:helion/repositories/categories/categories_repository.dart';
import 'package:helion/services/categories/categories_service.dart';
import 'package:helion/services/categories/categories_service_impl.dart';
import 'package:helion/services/network/network_connection_service.dart';
import 'package:helion/utils/consts.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mock_category_repository.dart';
import '../../utils/mock_network_connection_service.dart';

void main() {
  late final CategoriesRepository repository;
  late final CategoriesService categoriesService;
  late final NetworkConnectionService networkConnectionService;

  setUpAll(() {
    repository = MockCategoryRepository();
    networkConnectionService = MockNetworkConnectionService();
    categoriesService = CategoriesServiceImpl(
      repository,
      networkConnectionService,
    );
  });

  final tCategories = <Category>[
    Category(0, 'Promocja', '32052', <Category>[
      Category(319, 'Militaria. Technika wojskowa', '215', <Category>[])
    ]),
    Category(39, 'Edukcja', '2259', <Category>[
      Category(114, 'Chemia', '167', <Category>[]),
    ])
  ];
  final errMessage = 'Error occured while getting categories';

  test('should return all categories if getting them went successfully',
      () async {
    when(repository.getAllCategories()).thenAnswer(
      (_) async => tCategories,
    );
    final categories = await categoriesService.getAllCategories();
    verify(repository.getAllCategories());
    expect(
      categories,
      right(tCategories),
    );
  });

  test('should return failure if getting categories went unsuccessfully',
      () async {
    when(repository.getAllCategories()).thenThrow(
      CategoryException(errMessage),
    );
    final categories = await categoriesService.getAllCategories();

    verify(repository.getAllCategories());
    expect(
      categories,
      left(Failure(errMessage)),
    );
  });

  test('should return all categories if there is internet connection',
      () async {
    when(networkConnectionService.isConnected).thenAnswer(
      (_) async => true,
    );
    when(repository.getAllCategories()).thenAnswer(
      (_) async => tCategories,
    );
    final categories = await categoriesService.getAllCategories();
    verify(repository.getAllCategories());
    verify(networkConnectionService.isConnected);
    expect(
      categories,
      right(tCategories),
    );
  });

  test('should return failure if there is no internet connection', () async {
    when(networkConnectionService.isConnected).thenAnswer(
      (_) async => false,
    );
    final categories = await categoriesService.getAllCategories();
    verifyNever(repository.getAllCategories());
    verify(networkConnectionService.isConnected);
    expect(
      categories,
      left(Failure(NO_INTERNET_CONNECTION)),
    );
  });
}
