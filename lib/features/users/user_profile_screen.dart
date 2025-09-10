import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/settings/views/settings_screen.dart';
import 'package:day15/features/users/widgets/persistent_tab_bar.dart';
import 'package:day15/features/users/widgets/users_reply_timeline.dart';
import 'package:day15/features/users/widgets/users_thread_timeline.dart';
import 'package:day15/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/profile";
  static const routeName = "profile";
  const UserProfileScreen({super.key});

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  void _onBarPressed() {
    context.pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  FontAwesomeIcons.globe,
                                  size: Sizes.size24 + Sizes.size2,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.instagram,
                                      size: Sizes.size24 + Sizes.size2,
                                    ),
                                    Gaps.h20,
                                    IconButton(
                                      onPressed: _onBarPressed,
                                      icon: Icon(
                                        FontAwesomeIcons.bars,
                                        size: Sizes.size24 + Sizes.size2,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                "Jane",
                                style: TextStyle(
                                  fontSize: Sizes.size28,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "jane_mobbin",
                                        style: TextStyle(
                                          fontSize: Sizes.size16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gaps.h7,
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Sizes.size10,
                                          vertical: Sizes.size5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size20),
                                        ),
                                        child: Text(
                                          "threads.net",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              trailing: CircleAvatar(
                                foregroundImage: NetworkImage(
                                  getImage(),
                                ),
                                radius: Sizes.size32,
                              ),
                            ),
                            Gaps.v5,
                            Text(
                              "Plant enthusiast!",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.v24,
                            Row(
                              children: [
                                SizedBox(
                                  height: Sizes.size20,
                                  width: Sizes.size32,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        child: CircleAvatar(
                                          foregroundImage: NetworkImage(
                                            getImage(),
                                          ),
                                          radius: 10,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: CircleAvatar(
                                          foregroundImage: NetworkImage(
                                            getImage(),
                                          ),
                                          radius: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gaps.h10,
                                Text(
                                  "2 followers",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v24,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size5,
                                  ),
                                  alignment: Alignment.center,
                                  width: size.width * 0.44,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size10),
                                  ),
                                  child: Text(
                                    "Edit profile",
                                    style: TextStyle(
                                      fontSize: Sizes.size18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size5,
                                  ),
                                  alignment: Alignment.center,
                                  width: size.width * 0.44,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size10),
                                  ),
                                  child: Text(
                                    "Share profile",
                                    style: TextStyle(
                                      fontSize: Sizes.size18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v10,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => UsersThreadTimeline(),
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => UsersReplyTimeline(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
