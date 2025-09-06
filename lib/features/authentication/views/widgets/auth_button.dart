import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.size16,
        vertical: Sizes.size10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: BoxBorder.all(
          color: Colors.black26,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Gaps.h12,
          Text(
            text,
            style: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
