import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/settings/views/widget/privacy_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  static const routeUrl = "privacy";
  static const routeName = "privacy";
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _privateProfile = false;

  void _onBackPressed() {
    Navigator.of(context).pop();
  }

  void _onPrivateProfileChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _privateProfile = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        leadingWidth: size.width * 0.3,
        leading: GestureDetector(
          onTap: _onBackPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.h20,
              Icon(FontAwesomeIcons.chevronLeft),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                child: Column(
                  children: [
                    SwitchListTile.adaptive(
                      visualDensity: VisualDensity(vertical: -1),
                      contentPadding: EdgeInsets.zero,
                      value: _privateProfile,
                      onChanged: _onPrivateProfileChanged,
                      secondary: Icon(
                        FontAwesomeIcons.lock,
                        size: Sizes.size20 + Sizes.size2,
                      ),
                      title: Text(
                        "Private profile",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    PrivacyListTile(
                      leadingIcon: FontAwesomeIcons.at,
                      trailingIcon: FontAwesomeIcons.chevronRight,
                      text: "Mentions",
                      isTrailingText: true,
                      trailingText: "Everyone",
                    ),
                    PrivacyListTile(
                      leadingIcon: FontAwesomeIcons.solidBellSlash,
                      trailingIcon: FontAwesomeIcons.chevronRight,
                      text: "Muted",
                      isTrailingText: false,
                    ),
                    PrivacyListTile(
                      leadingIcon: FontAwesomeIcons.solidEyeSlash,
                      trailingIcon: FontAwesomeIcons.chevronRight,
                      text: "Hidden Words",
                      isTrailingText: false,
                    ),
                    PrivacyListTile(
                      leadingIcon: FontAwesomeIcons.users,
                      trailingIcon: FontAwesomeIcons.chevronRight,
                      text: "Profiles you follow",
                      isTrailingText: false,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      visualDensity: VisualDensity(vertical: -1),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Other privacy settings",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        FontAwesomeIcons.arrowUpRightFromSquare,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.85,
                      child: Text(
                        "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                        style: TextStyle(
                          height: 1.2,
                          fontSize: Sizes.size18,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Gaps.v10,
                    PrivacyListTile(
                      leadingIcon: FontAwesomeIcons.solidCircleXmark,
                      trailingIcon: FontAwesomeIcons.arrowUpRightFromSquare,
                      text: "Blocked profiles",
                      isTrailingText: false,
                    ),
                    PrivacyListTile(
                      leadingIcon: FontAwesomeIcons.heartCircleXmark,
                      trailingIcon: FontAwesomeIcons.arrowUpRightFromSquare,
                      text: "Hide likes",
                      isTrailingText: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
