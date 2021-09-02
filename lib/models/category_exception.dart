import 'package:equatable/equatable.dart';

class CategoryException extends Equatable implements Exception {
  final String message;

  CategoryException(this.message);

  @override
  List<Object?> get props => [message];
}
