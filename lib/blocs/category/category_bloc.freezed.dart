// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryEventTearOff {
  const _$CategoryEventTearOff();

  ReloadCategories reloadCategories() {
    return const ReloadCategories();
  }

  NetworkStatusChanged networkStatusChanged(ConnectionStatus status) {
    return NetworkStatusChanged(
      status,
    );
  }

  RetryButtonClicked retryButtonClicked() {
    return const RetryButtonClicked();
  }
}

/// @nodoc
const $CategoryEvent = _$CategoryEventTearOff();

/// @nodoc
mixin _$CategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reloadCategories,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
    required TResult Function() retryButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reloadCategories,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    TResult Function()? retryButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReloadCategories value) reloadCategories,
    required TResult Function(NetworkStatusChanged value) networkStatusChanged,
    required TResult Function(RetryButtonClicked value) retryButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReloadCategories value)? reloadCategories,
    TResult Function(NetworkStatusChanged value)? networkStatusChanged,
    TResult Function(RetryButtonClicked value)? retryButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  final CategoryEvent _value;
  // ignore: unused_field
  final $Res Function(CategoryEvent) _then;
}

/// @nodoc
abstract class $ReloadCategoriesCopyWith<$Res> {
  factory $ReloadCategoriesCopyWith(
          ReloadCategories value, $Res Function(ReloadCategories) then) =
      _$ReloadCategoriesCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReloadCategoriesCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements $ReloadCategoriesCopyWith<$Res> {
  _$ReloadCategoriesCopyWithImpl(
      ReloadCategories _value, $Res Function(ReloadCategories) _then)
      : super(_value, (v) => _then(v as ReloadCategories));

  @override
  ReloadCategories get _value => super._value as ReloadCategories;
}

/// @nodoc

class _$ReloadCategories implements ReloadCategories {
  const _$ReloadCategories();

  @override
  String toString() {
    return 'CategoryEvent.reloadCategories()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReloadCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reloadCategories,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
    required TResult Function() retryButtonClicked,
  }) {
    return reloadCategories();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reloadCategories,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    TResult Function()? retryButtonClicked,
    required TResult orElse(),
  }) {
    if (reloadCategories != null) {
      return reloadCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReloadCategories value) reloadCategories,
    required TResult Function(NetworkStatusChanged value) networkStatusChanged,
    required TResult Function(RetryButtonClicked value) retryButtonClicked,
  }) {
    return reloadCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReloadCategories value)? reloadCategories,
    TResult Function(NetworkStatusChanged value)? networkStatusChanged,
    TResult Function(RetryButtonClicked value)? retryButtonClicked,
    required TResult orElse(),
  }) {
    if (reloadCategories != null) {
      return reloadCategories(this);
    }
    return orElse();
  }
}

abstract class ReloadCategories implements CategoryEvent {
  const factory ReloadCategories() = _$ReloadCategories;
}

/// @nodoc
abstract class $NetworkStatusChangedCopyWith<$Res> {
  factory $NetworkStatusChangedCopyWith(NetworkStatusChanged value,
          $Res Function(NetworkStatusChanged) then) =
      _$NetworkStatusChangedCopyWithImpl<$Res>;
  $Res call({ConnectionStatus status});
}

/// @nodoc
class _$NetworkStatusChangedCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements $NetworkStatusChangedCopyWith<$Res> {
  _$NetworkStatusChangedCopyWithImpl(
      NetworkStatusChanged _value, $Res Function(NetworkStatusChanged) _then)
      : super(_value, (v) => _then(v as NetworkStatusChanged));

  @override
  NetworkStatusChanged get _value => super._value as NetworkStatusChanged;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(NetworkStatusChanged(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
    ));
  }
}

/// @nodoc

class _$NetworkStatusChanged implements NetworkStatusChanged {
  const _$NetworkStatusChanged(this.status);

  @override
  final ConnectionStatus status;

  @override
  String toString() {
    return 'CategoryEvent.networkStatusChanged(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NetworkStatusChanged &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  $NetworkStatusChangedCopyWith<NetworkStatusChanged> get copyWith =>
      _$NetworkStatusChangedCopyWithImpl<NetworkStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reloadCategories,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
    required TResult Function() retryButtonClicked,
  }) {
    return networkStatusChanged(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reloadCategories,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    TResult Function()? retryButtonClicked,
    required TResult orElse(),
  }) {
    if (networkStatusChanged != null) {
      return networkStatusChanged(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReloadCategories value) reloadCategories,
    required TResult Function(NetworkStatusChanged value) networkStatusChanged,
    required TResult Function(RetryButtonClicked value) retryButtonClicked,
  }) {
    return networkStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReloadCategories value)? reloadCategories,
    TResult Function(NetworkStatusChanged value)? networkStatusChanged,
    TResult Function(RetryButtonClicked value)? retryButtonClicked,
    required TResult orElse(),
  }) {
    if (networkStatusChanged != null) {
      return networkStatusChanged(this);
    }
    return orElse();
  }
}

abstract class NetworkStatusChanged implements CategoryEvent {
  const factory NetworkStatusChanged(ConnectionStatus status) =
      _$NetworkStatusChanged;

  ConnectionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkStatusChangedCopyWith<NetworkStatusChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetryButtonClickedCopyWith<$Res> {
  factory $RetryButtonClickedCopyWith(
          RetryButtonClicked value, $Res Function(RetryButtonClicked) then) =
      _$RetryButtonClickedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RetryButtonClickedCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements $RetryButtonClickedCopyWith<$Res> {
  _$RetryButtonClickedCopyWithImpl(
      RetryButtonClicked _value, $Res Function(RetryButtonClicked) _then)
      : super(_value, (v) => _then(v as RetryButtonClicked));

  @override
  RetryButtonClicked get _value => super._value as RetryButtonClicked;
}

/// @nodoc

class _$RetryButtonClicked implements RetryButtonClicked {
  const _$RetryButtonClicked();

  @override
  String toString() {
    return 'CategoryEvent.retryButtonClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RetryButtonClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reloadCategories,
    required TResult Function(ConnectionStatus status) networkStatusChanged,
    required TResult Function() retryButtonClicked,
  }) {
    return retryButtonClicked();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reloadCategories,
    TResult Function(ConnectionStatus status)? networkStatusChanged,
    TResult Function()? retryButtonClicked,
    required TResult orElse(),
  }) {
    if (retryButtonClicked != null) {
      return retryButtonClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReloadCategories value) reloadCategories,
    required TResult Function(NetworkStatusChanged value) networkStatusChanged,
    required TResult Function(RetryButtonClicked value) retryButtonClicked,
  }) {
    return retryButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReloadCategories value)? reloadCategories,
    TResult Function(NetworkStatusChanged value)? networkStatusChanged,
    TResult Function(RetryButtonClicked value)? retryButtonClicked,
    required TResult orElse(),
  }) {
    if (retryButtonClicked != null) {
      return retryButtonClicked(this);
    }
    return orElse();
  }
}

abstract class RetryButtonClicked implements CategoryEvent {
  const factory RetryButtonClicked() = _$RetryButtonClicked;
}

/// @nodoc
class _$CategoryStateTearOff {
  const _$CategoryStateTearOff();

  Initial initial(
      {required List<Category> categories,
      required bool isLoading,
      required bool hasInternetConnection,
      required bool hasError,
      required bool isRetryButtonClicked}) {
    return Initial(
      categories: categories,
      isLoading: isLoading,
      hasInternetConnection: hasInternetConnection,
      hasError: hasError,
      isRetryButtonClicked: isRetryButtonClicked,
    );
  }
}

/// @nodoc
const $CategoryState = _$CategoryStateTearOff();

/// @nodoc
mixin _$CategoryState {
  List<Category> get categories => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasInternetConnection => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isRetryButtonClicked => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Category> categories,
            bool isLoading,
            bool hasInternetConnection,
            bool hasError,
            bool isRetryButtonClicked)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Category> categories,
            bool isLoading,
            bool hasInternetConnection,
            bool hasError,
            bool isRetryButtonClicked)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res>;
  $Res call(
      {List<Category> categories,
      bool isLoading,
      bool hasInternetConnection,
      bool hasError,
      bool isRetryButtonClicked});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  final CategoryState _value;
  // ignore: unused_field
  final $Res Function(CategoryState) _then;

  @override
  $Res call({
    Object? categories = freezed,
    Object? isLoading = freezed,
    Object? hasInternetConnection = freezed,
    Object? hasError = freezed,
    Object? isRetryButtonClicked = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasInternetConnection: hasInternetConnection == freezed
          ? _value.hasInternetConnection
          : hasInternetConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isRetryButtonClicked: isRetryButtonClicked == freezed
          ? _value.isRetryButtonClicked
          : isRetryButtonClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Category> categories,
      bool isLoading,
      bool hasInternetConnection,
      bool hasError,
      bool isRetryButtonClicked});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$CategoryStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? categories = freezed,
    Object? isLoading = freezed,
    Object? hasInternetConnection = freezed,
    Object? hasError = freezed,
    Object? isRetryButtonClicked = freezed,
  }) {
    return _then(Initial(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasInternetConnection: hasInternetConnection == freezed
          ? _value.hasInternetConnection
          : hasInternetConnection // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isRetryButtonClicked: isRetryButtonClicked == freezed
          ? _value.isRetryButtonClicked
          : isRetryButtonClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required this.categories,
      required this.isLoading,
      required this.hasInternetConnection,
      required this.hasError,
      required this.isRetryButtonClicked});

  @override
  final List<Category> categories;
  @override
  final bool isLoading;
  @override
  final bool hasInternetConnection;
  @override
  final bool hasError;
  @override
  final bool isRetryButtonClicked;

  @override
  String toString() {
    return 'CategoryState.initial(categories: $categories, isLoading: $isLoading, hasInternetConnection: $hasInternetConnection, hasError: $hasError, isRetryButtonClicked: $isRetryButtonClicked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.hasInternetConnection, hasInternetConnection) ||
                const DeepCollectionEquality().equals(
                    other.hasInternetConnection, hasInternetConnection)) &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)) &&
            (identical(other.isRetryButtonClicked, isRetryButtonClicked) ||
                const DeepCollectionEquality()
                    .equals(other.isRetryButtonClicked, isRetryButtonClicked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(hasInternetConnection) ^
      const DeepCollectionEquality().hash(hasError) ^
      const DeepCollectionEquality().hash(isRetryButtonClicked);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Category> categories,
            bool isLoading,
            bool hasInternetConnection,
            bool hasError,
            bool isRetryButtonClicked)
        initial,
  }) {
    return initial(categories, isLoading, hasInternetConnection, hasError,
        isRetryButtonClicked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Category> categories,
            bool isLoading,
            bool hasInternetConnection,
            bool hasError,
            bool isRetryButtonClicked)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(categories, isLoading, hasInternetConnection, hasError,
          isRetryButtonClicked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CategoryState {
  const factory Initial(
      {required List<Category> categories,
      required bool isLoading,
      required bool hasInternetConnection,
      required bool hasError,
      required bool isRetryButtonClicked}) = _$Initial;

  @override
  List<Category> get categories => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get hasInternetConnection => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  bool get isRetryButtonClicked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}
