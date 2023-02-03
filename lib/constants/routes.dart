import 'package:file_converter/screens/download_screen_single.dart';
import 'package:file_converter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case "history":
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case "download":
        return MaterialPageRoute(
          builder: (context) => Download(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }
  }
}
