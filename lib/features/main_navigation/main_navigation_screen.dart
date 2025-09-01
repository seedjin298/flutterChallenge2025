import 'package:day15/constants/sizes.dart';
import 'package:day15/features/main_navigation/widgets/nav_tab.dart';
import 'package:day15/features/posts/activity_screen.dart';
import 'package:day15/features/posts/new_thread_screen.dart';
import 'package:day15/features/posts/posts_timeline_screen.dart';
import 'package:day15/features/posts/search_screen.dart';
import 'package:day15/users/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "",
    "search",
    "write",
    "activity",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostTap(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewThreadScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: PostsTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size16,
        ),
        height: Sizes.size60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavTab(
              onTap: () => _onTap(0),
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
            ),
            NavTab(
              onTap: () => _onTap(1),
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
            ),
            NavTab(
              onTap: () => _onPostTap(context),
              isSelected: _selectedIndex == 2,
              icon: _selectedIndex == 2
                  ? FontAwesomeIcons.solidPenToSquare
                  : FontAwesomeIcons.penToSquare,
            ),
            NavTab(
              onTap: () => _onTap(3),
              isSelected: _selectedIndex == 3,
              icon: _selectedIndex == 3
                  ? FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
            ),
            NavTab(
              onTap: () => _onTap(4),
              isSelected: _selectedIndex == 4,
              icon: _selectedIndex == 4
                  ? FontAwesomeIcons.solidUser
                  : FontAwesomeIcons.user,
            ),
          ],
        ),
      ),
    );
  }
}
