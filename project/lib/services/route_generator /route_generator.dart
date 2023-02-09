import 'package:flutter/material.dart';
import 'package:project/presentation/screens/details_screen/details_screen.dart';
import 'package:project/presentation/screens/main_screen/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case '/detail_screen':
        return MaterialPageRoute(builder: (context) => DetailsScreen());
      default:
        return _defaultRoute();
    }
  }

  static Route<dynamic> _defaultRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}