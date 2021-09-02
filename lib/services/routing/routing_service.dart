import 'package:flutter/material.dart';
import 'package:helion/screens/screens.dart';

class Screens {
  static const initial = '/';
}

class RoutingService {
  Route? routes(RouteSettings settings) {
    switch (settings.name) {
      case Screens.initial:
        return categories();
      default:
        return categories();
    }
  }

  MaterialPageRoute<Categories> categories() {
    return MaterialPageRoute(
      builder: (context) {
        return Categories();
      },
    );
  }
}
