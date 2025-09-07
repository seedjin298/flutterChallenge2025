import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 1.0,
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size20,
        ),
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            "Replies",
            style: TextStyle(
              fontSize: Sizes.size18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 51.0;

  @override
  double get minExtent => 51.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
