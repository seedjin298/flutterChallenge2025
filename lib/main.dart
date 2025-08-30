import 'package:day15/features/authentication/login_screen.dart';
import 'package:day15/features/authentication/sign_up_screen.dart';
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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        splashColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        splashColor: Colors.transparent,
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade500,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.black,
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        bottomAppBarTheme: BottomAppBarThemeData(
          color: Colors.grey.shade900,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
      ),
      home: MainNavigationScreen(),
    );
  }
}
