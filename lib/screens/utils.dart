import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helion/models/category.dart';

class Utils {
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
        Expanded(child: strip(context, scale: 0.2)),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              child: _content(category, context),
            )),
      ],
    );
  }

  static Widget _content(Category category, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: textField(category.id.toString(),
                AppLocalizations.of(context)!.categoryIDLabel)),
        Expanded(
            child: textField(
          category.name,
          AppLocalizations.of(context)!.categoryNameLabel,
        )),
        Expanded(
            child: textField(
          category.booksAmount,
          AppLocalizations.of(context)!.categoryBooksAmountLabel,
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

  static Widget textField(
    String value,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
        )
      ],
    );
  }
}
