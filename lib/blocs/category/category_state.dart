part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial({
    required List<Category> categories,
    required bool isLoading,
    required bool hasInternetConnection,
    required bool hasError,
    required bool isRetryButtonClicked,
  }) = Initial;
}
