import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatefulWidget {
  final IconData icon;
  final String text;

  const SettingListTile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<SettingListTile> createState() => _SettingListTileState();
}

class _SettingListTileState extends State<SettingListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -1),
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        widget.icon,
        size: Sizes.size20 + Sizes.size2,
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          fontSize: Sizes.size18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
