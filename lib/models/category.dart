import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String booksAmount;
  final List<Category> subcategories;

  Category(
    this.id,
    this.name,
    this.booksAmount,
    this.subcategories,
  );

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.booksAmount,
        this.subcategories,
      ];
}
