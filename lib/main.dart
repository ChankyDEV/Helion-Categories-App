import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:helion/config.dart';
import 'package:helion/services/routing/routing_service.dart';

void main() async {
  final config = Config();
  await config.configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routing = GetIt.I.get<RoutingService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('pl', ''),
      ],
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.title;
      },
      onGenerateRoute: routing.routes,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.blue,
        primaryColorLight: Colors.white,
        fontFamily: 'Marcellus',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
