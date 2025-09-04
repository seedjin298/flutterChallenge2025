import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/settings/view_models/theme_mode_view_model.dart';
import 'package:day15/settings/views/privacy_screen.dart';
import 'package:day15/settings/views/widget/setting_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeUrl = "/settings";
  static const routeName = "settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLogOutPressed = false;

  void _onBackPressed() {
    Navigator.of(context).pop();
  }

  void _onPrivacyPressed() {
    context.pushNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = context.watch<ThemeModeViewModel>().darkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
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
                    SettingListTile(
                      icon: FontAwesomeIcons.userPlus,
                      text: "Follow and invite friends",
                    ),
                    SettingListTile(
                      icon: FontAwesomeIcons.solidBell,
                      text: "Notifications",
                    ),
                    GestureDetector(
                      onTap: _onPrivacyPressed,
                      child: SettingListTile(
                        icon: FontAwesomeIcons.lock,
                        text: "Privacy",
                      ),
                    ),
                    SettingListTile(
                      icon: FontAwesomeIcons.solidCircleUser,
                      text: "Account",
                    ),
                    SettingListTile(
                      icon: FontAwesomeIcons.solidLifeRing,
                      text: "Help",
                    ),
                    SettingListTile(
                      icon: FontAwesomeIcons.circleInfo,
                      text: "About",
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
                  children: [
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      value: isDarkMode,
                      onChanged: (value) {
                        context.read<ThemeModeViewModel>().setDarkMode(value);
                        setState(() {});
                      },
                      title: Text(
                        "Change to ${isDarkMode ? "Light" : "Dark"} Mode",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(vertical: -1),
                      contentPadding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _isLogOutPressed = true;
                        });
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text("Are you sure?"),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () {
                                  setState(() {
                                    _isLogOutPressed = false;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text("No"),
                              ),
                              CupertinoDialogAction(
                                onPressed: () {
                                  setState(() {
                                    _isLogOutPressed = false;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                        );
                      },
                      title: Text(
                        "Log out",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: _isLogOutPressed
                          ? CupertinoActivityIndicator()
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
