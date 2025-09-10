import 'package:day15/constants/gaps.dart';
import 'package:day15/features/posts/view_models/timeline_view_model.dart';
import 'package:day15/features/posts/views/widgets/go_to_top_button.dart';
import 'package:day15/features/posts/views/widgets/thread.dart';
import 'package:day15/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PostsTimelineScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/home";
  static const routeName = "postsTimeline";

  const PostsTimelineScreen({super.key});

  @override
  PostsTimelineScreenState createState() => PostsTimelineScreenState();
}

class PostsTimelineScreenState extends ConsumerState<PostsTimelineScreen> {
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
    final isDarkMode = ref.watch(themeModeProvider).darkMode;
    return ref.watch(timelineProvider).when(
          loading: () => Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              'Could not load posts: $error',
            ),
          ),
          data: (threads) => Scaffold(
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
                      title: Center(
                        child: SvgPicture.asset(
                          'assets/images/thread.svg',
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            isDarkMode ? Colors.white : Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final threadData = threads[index];
                          return Stack(
                            children: [
                              Column(
                                children: [
                                  Thread(
                                    threadData: threadData,
                                  ),
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
                        childCount: threads.length,
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
          ),
        );
  }
}
