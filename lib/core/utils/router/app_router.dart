import 'package:evently_project/core/utils/router/route_names.dart';
import 'package:evently_project/features/home/home_view.dart';
import 'package:evently_project/features/onboarding/views/onboarding_view.dart';
import 'package:evently_project/features/onboarding/views/personalis_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.personaliseView:
        return MaterialPageRoute(
          builder: (_) {
            return PersonalizeView();
          },
        );
      case RouteNames.homeView:
        return MaterialPageRoute(
          builder: (_) {
            return HomeView();
          },
        );
      case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (_) {
            return OnboardingView();
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
