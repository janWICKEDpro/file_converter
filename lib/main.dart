import 'package:file_converter/business_logic/cubits/bottom_nav_bloc/bottom_nav_cubit.dart';
import 'package:file_converter/business_logic/cubits/file_selection_bloc/file_bloc.dart';
import 'package:file_converter/constants/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final router = Routes();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(create: (context) => FileCubit())
      ],
      child: MaterialApp(
        title: "Flutter app",
        debugShowCheckedModeBanner: false,

        // showPerformanceOverlay: true,
        // restorationScopeId: ,
        theme: ThemeData(
            disabledColor: Colors.black,
            useMaterial3: true,
            bottomNavigationBarTheme:
                const BottomNavigationBarThemeData(elevation: 10),
            primaryIconTheme:
                const IconThemeData(color: Colors.deepOrangeAccent, size: 30),
            primaryColor: Colors.deepOrangeAccent,
            backgroundColor: Colors.deepOrangeAccent),
        themeMode: ThemeMode.dark,
        onGenerateRoute: router.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
