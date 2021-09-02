import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:helion/blocs/category/category_bloc.dart';
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
    final categoryBloc = GetIt.I.get<CategoryBloc>();
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) => categoryBloc,
              child: Categories(),
            ));
  }
}
