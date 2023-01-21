import 'package:file_converter/routes.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final router = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      // restorationScopeId: ,
      theme: ThemeData(
          disabledColor: Colors.black,
          useMaterial3: true,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 10),
          primaryIconTheme:
              IconThemeData(color: Colors.deepOrangeAccent, size: 30),
          primaryColor: Colors.deepOrangeAccent,
          backgroundColor: Colors.deepOrangeAccent),
      themeMode: ThemeMode.dark,
      onGenerateRoute: router.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
