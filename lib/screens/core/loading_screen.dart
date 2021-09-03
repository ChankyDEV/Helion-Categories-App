import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helion/screens/images.dart';
import 'package:helion/screens/styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Images.general.loadingImage,
            Text(
              AppLocalizations.of(context)!.loading,
              style: Styles.general.headerBig,
            ),
          ],
        ),
      ),
    );
  }
}
