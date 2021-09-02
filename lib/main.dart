import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:helion/config.dart';
import 'package:helion/screens/screens.dart';
import 'package:helion/services/routing/routing_service.dart';

void main() async {
  final config = Config(GetIt.instance);
  await config.configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routing = GetIt.I.get<RoutingService>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helion Recruitment App',
      onGenerateRoute: routing.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Categories(),
    );
  }


}

