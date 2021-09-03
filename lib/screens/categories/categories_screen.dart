import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helion/blocs/category/category_bloc.dart';
import 'package:helion/models/category.dart';
import 'package:helion/screens/core/info_screen_with_retry_button.dart';
import 'package:helion/screens/core/loading_screen.dart';
import 'package:helion/screens/images.dart';
import 'package:helion/screens/styles.dart';
import 'package:helion/screens/utils.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  void reloadCategories(BuildContext context) =>
      BlocProvider.of<CategoryBloc>(context).add(
        CategoryEvent.reloadCategories(),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listenWhen: (previous, current) =>
            previous.hasError == false && current.hasError == true,
        listener: (context, state) {
          if (state.hasError == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              Utils.snackBar(
                context,
                errorMessage: AppLocalizations.of(context)!.errorMessage,
              ),
            );
          }
        },
        builder: (context, state) {
          return state.isLoading
              ? _showLoadingIndicator()
              : Scaffold(
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
                  body: state.hasInternetConnection
                      ? state.categories.isEmpty
                          ? InfoScreenWithRetryButton(
                              information:
                                  'Nie mamy dla Ciebie żadnych kategorii',
                              image: Images.general.noDataImage,
                              isRetryButtonClicked: state.isRetryButtonClicked,
                              onRetryButtonClick: () =>
                                  BlocProvider.of<CategoryBloc>(context).add(
                                CategoryEvent.retryButtonClicked(),
                              ),
                            )
                          : _showCategories(state, context)
                      : InfoScreenWithRetryButton(
                          information: AppLocalizations.of(context)!
                              .noInternetConnectionLabel,
                          image: Images.general.noInternetImage,
                          isRetryButtonClicked: state.isRetryButtonClicked,
                          onRetryButtonClick: () =>
                              BlocProvider.of<CategoryBloc>(context).add(
                            CategoryEvent.retryButtonClicked(),
                          ),
                        ),
                );
        },
      ),
    );
  }

  Widget _showCategories(
    CategoryState state,
    BuildContext context,
  ) {
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

  Widget _buildCategoryTile(
    int index,
    Category category,
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                    color: Theme.of(context).primaryColor,
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
                    style: Styles.general.body,
                  ),
                ),
              ],
            ),
            subtitle: category.hasSubcategories
                ? null
                : Text(
                    AppLocalizations.of(context)!
                        .categoryWithoutSubcategoriesLabel,
                    style: Styles.general.sideNote,
                  ),
            children: [...subcategoriesList(category.subcategories, context)],
          ),
          GestureDetector(
            child: Container(
              width: index == 0 ? width : width * 0.83,
              height: height * 0.08,
              color: Colors.transparent,
            ),
            onTap: () => Utils.showCategoryInfoDialog(
              context,
              category,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> subcategoriesList(
    List<Category> subcategories,
    BuildContext context,
  ) {
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
                Text(
                  subcategory.name,
                  style: Styles.general.body,
                ),
                const SizedBox(
                  height: 10,
                ),
                Utils.strip(
                  context,
                  scale: 0.15,
                ),
              ],
            ),
            onTap: () => Utils.showCategoryInfoDialog(
              context,
              subcategory,
            ),
          ),
        ),
      );
    });
    return subcategoriesTiles;
  }

  Widget _showLoadingIndicator() {
    return LoadingScreen();
  }
}
