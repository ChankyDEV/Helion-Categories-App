import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helion/blocs/category/category_bloc.dart';
import 'package:helion/models/category.dart';
import 'package:helion/screens/utils.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  void reloadCategories(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context)
        .add(CategoryEvent.reloadCategories());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                state.isLoading
                    ? const SizedBox()
                    : state.hasInternetConnection
                    ? IconButton(
                    onPressed: () => reloadCategories(context),
                    icon: Icon(Icons.download_rounded))
                    : const SizedBox()
              ],
              title: Text(
                AppLocalizations.of(context)!.categoriesHeader,
              ),
              centerTitle: true,
            ),
            body: state.isLoading
                ? _showLoadingIndicator()
                : state.hasInternetConnection
                ? _showCategories(state, context)
                : _showNoInternetConnection(
              context,
              state,
            ),
          );
        },
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

  Widget _showCategories(CategoryState state,
      BuildContext context,) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: state.categories.length,
      itemBuilder: (context, index) {
        final category = state.categories[index];
        return _buildCategoryTile(
          index,
          category,
          context,
        );
      },
    );
  }

  Widget _showNoInternetConnection(BuildContext context,
      CategoryState state,) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset('assets/images/no_internet_img.png'),
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.noInternetConnectionLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _buildRetryButton(
                    context,
                    state,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(int index,
      Category category,
      BuildContext context,) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Card(
      child: Stack(
        children: [
          ExpansionTile(
            trailing: category.hasSubcategories
                ? Icon(Icons.more_horiz_rounded)
                : const SizedBox(),
            textColor: Colors.black,
            iconColor: Colors.black,
            title: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: width * 0.6,
                  child: Text(
                    category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            subtitle: category.hasSubcategories
                ? null
                : Text(
              AppLocalizations.of(context)!
                  .categoryWithoutSubcategoriesLabel,
              style: TextStyle(
                fontSize: 11.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            children: [...listSubcategories(category.subcategories, context)],
          ),
          GestureDetector(
            child: Container(
              width: index == 0 ? width : width * 0.83,
              height: height * 0.08,
              color: Colors.transparent,
            ),
            onTap: () =>
                Utils.showCategoryInfoDialog(
                  context,
                  category,
                ),
          ),
        ],
      ),
    );
  }

  List<Widget> listSubcategories(List<Category> subcategories,
      BuildContext context,) {
    final subcategoriesTiles = <Widget>[];
    subcategoriesTiles.add(
      Container(
        height: 1,
        color: Colors.grey.withOpacity(0.4),
      ),
    );
    subcategories.forEach((subcategory) {
      subcategoriesTiles.add(
        Card(
          shadowColor: Colors.black,
          elevation: 2,
          semanticContainer: true,
          child: ListTile(
            title: Column(
              children: [
                Text(subcategory.name),
                const SizedBox(
                  height: 10,
                ),
                Utils.strip(context, scale: 0.15),
              ],
            ),
            onTap: () =>
                Utils.showCategoryInfoDialog(
                  context,
                  subcategory,
                ),
          ),
        ),
      );
    });
    return subcategoriesTiles;
  }

  Widget _buildRetryButton(BuildContext context,
      CategoryState state,) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.center,
        width: width * 0.4,
        height: height * 0.065,
        child: Text(
          'Ponów'.toUpperCase(),
          style: TextStyle(
            color: Theme
                .of(context)
                .primaryColorLight,
            fontSize: 16.0,
          ),
        ),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .primaryColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
