import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeUrl = "/login";
  static String routeName = "login";

  const LoginScreen({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "English (US)",
          style: TextStyle(
            fontSize: Sizes.size16,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
