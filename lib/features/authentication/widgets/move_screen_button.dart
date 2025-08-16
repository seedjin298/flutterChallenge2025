import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class MoveScreenButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final Color color;

  const MoveScreenButton({
    super.key,
    required this.text,
    required this.disabled,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: disabled ? Colors.grey.shade400 : color,
        ),
        duration: Duration(milliseconds: 300),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
