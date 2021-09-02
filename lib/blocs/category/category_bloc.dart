import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helion/core/network/network_connection_service.dart';
import 'package:helion/models/category.dart';
import 'package:helion/models/failures.dart';
import 'package:helion/services/category/category_service.dart';

part 'category_bloc.freezed.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService _categoryService;
  final NetworkConnectionChecker _networkChecker;

  CategoryBloc(
    this._categoryService,
    this._networkChecker,
  ) : super(
          CategoryState.initial(
            categories: <Category>[],
            isLoading: true,
            hasInternetConnection: true,
            hasError: true,
            isRetryButtonClicked: false,
          ),
        ) {
    listenOnNetworkStatus();
    getCategories();
  }

  void listenOnNetworkStatus() {
    _networkChecker.onNetworkStatusChange.listen((status) {
      if (status == ConnectionStatus.disconnected ||
          status == ConnectionStatus.connected) {
        if (status == ConnectionStatus.connected) {
          getCategories();
        }
        this.add(
          CategoryEvent.networkStatusChanged(status),
        );
      }
    });
  }

  void getCategories() {
    this.add(
      CategoryEvent.reloadCategories(),
    );
  }

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    yield* event.map(
      reloadCategories: _reloadCategories,
      networkStatusChanged: _networkStatusChanged,
      retryButtonClicked: _retryButtonClicked,
    );
  }

  Stream<CategoryState> _reloadCategories(ReloadCategories value) async* {
    yield state.copyWith(isLoading: true);
    final categoriesOrFailure = await _categoryService.getAllCategories();
    yield categoriesOrFailure.fold<CategoryState>(
      (l) => _showFailure(state, failure: l),
      (r) => _showCategories(r),
    );
  }

  Stream<CategoryState> _networkStatusChanged(
    NetworkStatusChanged value,
  ) async* {
    if (value.status == ConnectionStatus.connected) {
      yield state.copyWith(
        hasInternetConnection: true,
        isLoading: false,
      );
    } else {
      yield state.copyWith(
        hasInternetConnection: false,
        isLoading: false,
      );
    }
  }

  CategoryState _showFailure(CategoryState state, {required Failure failure}) {
    return state.copyWith(
      isLoading: false,
      hasError: true,
      isRetryButtonClicked: false,
    );
  }

  CategoryState _showCategories(List<Category> categories) {
    return state.copyWith(
      isLoading: false,
      isRetryButtonClicked: false,
      categories: categories,
    );
  }

  Stream<CategoryState> _retryButtonClicked(RetryButtonClicked value) async* {
    yield state.copyWith(
      isRetryButtonClicked: true,
      hasError: false,
    );
    // Animation purpose
    await Future.delayed(const Duration(seconds: 2));
    final categoriesOrFailure = await _categoryService.getAllCategories();
    yield categoriesOrFailure.fold<CategoryState>(
      (l) => _showFailure(state, failure: l),
      (r) => _showCategories(r),
    );
  }
}
