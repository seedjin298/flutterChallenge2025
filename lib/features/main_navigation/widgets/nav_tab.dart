import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final bool isSelected;

  const NavTab({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        behavior: HitTestBehavior.translucent,
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.35,
          duration: Duration(milliseconds: 100),
          child: Container(
            alignment: Alignment.center,
            child: FaIcon(
              icon,
              size: Sizes.size28,
            ),
          ),
        ),
      ),
    );
  }
}
