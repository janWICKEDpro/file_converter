import 'package:file_converter/bloc/bottom_nav_bloc/bottom_nav_cubit.dart';
import 'package:file_converter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case "history":
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }
  }
}
