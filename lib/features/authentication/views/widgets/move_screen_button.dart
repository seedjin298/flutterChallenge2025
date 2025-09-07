import 'package:day15/constants/sizes.dart';
import 'package:day15/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoveScreenButton extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider).darkMode;
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: disabled
              ? isDarkMode
                  ? Colors.grey.shade800
                  : Colors.grey.shade300
              : Theme.of(context).primaryColor,
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
