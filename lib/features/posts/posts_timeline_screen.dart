import 'package:day15/constants/gaps.dart';
import 'package:day15/features/posts/widgets/go_to_top_button.dart';
import 'package:day15/features/posts/widgets/thread.dart';
import 'package:day15/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PostsTimelineScreen extends StatefulWidget {
  static const routeUrl = "/";
  static const routeName = "postsTimeline";

  const PostsTimelineScreen({super.key});

  @override
  State<PostsTimelineScreen> createState() => _PostsTimelineScreenState();
}

class _PostsTimelineScreenState extends State<PostsTimelineScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showModal = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showModal) return;
      setState(() {
        _showModal = true;
      });
    } else {
      setState(() {
        _showModal = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeModeViewModel>().darkMode;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 80,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: SvgPicture.asset(
                  'assets/images/thread.svg',
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: const [
                            Thread(),
                            Gaps.v16,
                            Divider(
                              height: 0,
                              thickness: 1,
                            ),
                            Gaps.v16,
                          ],
                        ),
                      ],
                    );
                  },
                  childCount: 10,
                ),
              )
            ],
          ),
          if (_showModal)
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const GoToTopButton(),
              ),
            )
        ],
      ),
    );
  }
}
