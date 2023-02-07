import 'package:file_converter/business_logic/cubits/file_conversion_cubit/file_conversion_cubit.dart';
import 'package:file_converter/business_logic/cubits/file_selection_cubit/file_bloc.dart';
import 'package:file_converter/screens/download_screen.dart';
import 'package:file_converter/screens/history.dart';
import 'package:file_converter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case "history":
        return MaterialPageRoute(
          builder: (context) => const History(),
        );
      case "download":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FileConversionCubit(
                fileState: BlocProvider.of<FileCubit>(context).state),
            child: DownloadScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }
  }
}
