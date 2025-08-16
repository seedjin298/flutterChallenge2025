import 'package:day15/features/authentication/interests_detail_screen.dart';
import 'package:day15/features/authentication/interests_screen.dart';
import 'package:day15/features/authentication/login_screen.dart';
import 'package:day15/features/authentication/password_screen.dart';
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
      ),
      home: InterestsDetailScreen(),
    );
  }
}
