import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/posts/widgets/activity_list_tile.dart';
import 'package:day15/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class ActivityScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/activity";
  static const routeName = "activity";

  const ActivityScreen({super.key});

  @override
  ActivityScreenState createState() => ActivityScreenState();
}

class ActivityScreenState extends ConsumerState<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = ref.watch(themeModeProvider).darkMode;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Activity",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Sizes.size28,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            padding: EdgeInsets.only(
              left: Sizes.size12,
            ),
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(
              horizontal: Sizes.size5,
            ),
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: Colors.transparent,
            // unselectedLabelColor: Colors.black,
            labelColor: Theme.of(context).scaffoldBackgroundColor,
            tabs: [
              for (var tab in tabs)
                Tab(
                  height: Sizes.size40,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      color: tabs[_tabIndex] == tab
                          ? isDarkMode
                              ? Colors.white
                              : Colors.black
                          : Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(
                        color: tabs[_tabIndex] == tab
                            ? Colors.transparent
                            : Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                    ),
                    child: Text(tab),
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Gaps.v10,
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) =>
                        ActivityListTile(),
                  ),
                ),
              ],
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
