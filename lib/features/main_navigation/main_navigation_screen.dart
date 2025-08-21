import 'package:day15/constants/sizes.dart';
import 'package:day15/features/main_navigation/temporal_screen.dart';
import 'package:day15/features/main_navigation/widgets/nav_tab.dart';
import 'package:day15/features/posts/new_thread_screen.dart';
import 'package:day15/features/posts/posts_timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
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
            child: TemporalScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: TemporalScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: TemporalScreen(),
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
