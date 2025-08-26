import 'package:day15/features/main_navigation/main_navigation_screen.dart';
import 'package:day15/settings/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Day 15',
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
        ),
      ),
      home: MainNavigationScreen(),
    );
  }
}
