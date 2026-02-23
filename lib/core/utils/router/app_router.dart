import 'package:evently_project/core/utils/router/route_names.dart';
import 'package:evently_project/home_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeView:
        return MaterialPageRoute(
          builder: (_) {
            return HomeView();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Text("undefinded route");
          },
        );
    }
  }
}
