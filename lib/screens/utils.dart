import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helion/models/category.dart';
import 'package:helion/screens/styles.dart';

class Utils {
  static SnackBar snackBar(
    BuildContext context, {
    required String errorMessage,
    double widthPercentage = 0.8,
    double heightPercentage = 0.08,
    Duration duration = const Duration(milliseconds: 3500),
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SnackBar(
      backgroundColor: Colors.white60,
      behavior: SnackBarBehavior.fixed,
      content: Container(
        alignment: Alignment.center,
        width: width * widthPercentage,
        height: height * heightPercentage,
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.0,
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      elevation: 0.0,
      duration: duration,
    );
  }

  static void showCategoryInfoDialog(
    BuildContext context,
    Category category,
  ) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: width * 0.8,
              height: height * 0.3,
              child: _showCategoryContent(
                category,
                width,
                height,
                context,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Widget _showCategoryContent(
    Category category,
    double width,
    double height,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: strip(context, scale: 0.2),
        ),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              child: _content(
                category,
                context,
              ),
            )),
      ],
    );
  }

  static Widget _content(Category category, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: textWithDescription(context,
              value: category.id.toString(),
              description: AppLocalizations.of(context)!.categoryIDLabel),
        ),
        Expanded(
            child: textWithDescription(
          context,
          value: category.name,
          description: AppLocalizations.of(context)!.categoryNameLabel,
        )),
        Expanded(
            child: textWithDescription(
          context,
          value: category.booksAmount,
          description: AppLocalizations.of(context)!.categoryBooksAmountLabel,
        )),
      ],
    );
  }

  static Widget strip(
    BuildContext context, {
    scale,
  }) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * scale,
          height: 10.0 * scale,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ],
    );
  }

  static Widget textWithDescription(
    BuildContext context, {
    required String value,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description.toUpperCase(),
          style: Styles.general.descriptionLabelBold,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: Styles.general.body,
        )
      ],
    );
  }
}
