import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class InterestDetailButton extends StatefulWidget {
  final String interest;
  const InterestDetailButton({
    super.key,
    required this.interest,
  });

  @override
  State<InterestDetailButton> createState() => _InterestDetailButtonState();
}

class _InterestDetailButtonState extends State<InterestDetailButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color: _isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(Sizes.size32),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.1),
          ),
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
