import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class PrivacyListTile extends StatefulWidget {
  final IconData leadingIcon;
  final IconData trailingIcon;
  final String text;
  final bool isTrailingText;
  final String? trailingText;

  const PrivacyListTile({
    super.key,
    required this.text,
    required this.isTrailingText,
    required this.leadingIcon,
    required this.trailingIcon,
    this.trailingText,
  });

  @override
  State<PrivacyListTile> createState() => _PrivacyListTileState();
}

class _PrivacyListTileState extends State<PrivacyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -1),
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        widget.leadingIcon,
        size: Sizes.size20 + Sizes.size2,
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          fontSize: Sizes.size18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: widget.isTrailingText
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.trailingText!,
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.h10,
                Icon(
                  widget.trailingIcon,
                  color: Colors.grey.shade500,
                  size: Sizes.size20,
                ),
              ],
            )
          : Icon(
              widget.trailingIcon,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
    );
  }
}
