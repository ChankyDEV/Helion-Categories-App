part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.reloadCategories() = ReloadCategories;

  const factory CategoryEvent.networkStatusChanged(ConnectionStatus status) =
      NetworkStatusChanged;
}
