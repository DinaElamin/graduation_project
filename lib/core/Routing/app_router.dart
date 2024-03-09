
import 'package:ablexa/features/feature_landing_page/presentations/screens/feature_landing_page.dart';
import 'package:flutter/material.dart';
import 'routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landingPage:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defind ${settings.name}")),
          ),
        );
    }
  }
}
