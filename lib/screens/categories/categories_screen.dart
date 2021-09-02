import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helion/blocs/category/category_bloc.dart';
import 'package:helion/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.isLoading
                ? _showLoadingIndicator()
                : state.hasInternetConnection
                    ? _showCategories(state)
                    : _showNoInternetConnection();
          },
        ),
      ),
    );
  }

  Widget _showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }

  Widget _showCategories(CategoryState state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: state.categories.length,
      itemBuilder: (context, index) {
        final category = state.categories[index];
        return _buildCategoryTile(category);
      },
    );
  }

  Widget _showNoInternetConnection() {
    return Center(
      child: Text('Nie masz internetu :('),
    );
  }

  Widget _buildCategoryTile(Category category) {
    return Card(
      child: ExpansionTile(
        trailing: category.hasSubcategories
            ? Icon(Icons.arrow_drop_down)
            : const SizedBox(),
        textColor: Colors.black,
        iconColor: Colors.black,
        title: Text(category.name),
        children: [...listSubcategories(category.subcategories)],
      ),
    );
  }

  List<Widget> listSubcategories(List<Category> subcategories) {
    final subcategoriesTiles = <Widget>[];
    subcategories.forEach((subcategory) {
      subcategoriesTiles.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(subcategory.name),
          ),
        ),
      );
    });
    return subcategoriesTiles;
  }
}
