import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 1.3,
        fontSize: Sizes.size24 + Sizes.size2,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
