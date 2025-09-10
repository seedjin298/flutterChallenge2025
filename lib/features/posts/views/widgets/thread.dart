import 'package:day15/constants/gaps.dart';
import 'package:day15/features/posts/models/thread_model.dart';
import 'package:day15/features/posts/views/bottom_sheet_screen.dart';
import 'package:day15/features/posts/views/widgets/image_carousel.dart';
import 'package:day15/features/posts/views/widgets/reply_timeline.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Thread extends StatelessWidget {
  final ThreadModel threadData;

  const Thread({
    super.key,
    required this.threadData,
  });

  void _onEllipsisTap(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) => BottomSheetScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userName = threadData.creator;
    final sentence = threadData.sentence;
    final since =
        ((DateTime.now().millisecondsSinceEpoch - threadData.createdAt) / 60000)
            .floor();
    final replies = threadData.replies; // 0~3
    final likes = threadData.likes;
    final imageUrl = threadData.imageUrl;
    final hasImage = imageUrl != "";
    final repliers = threadData.repliers;
    final images = [imageUrl];

    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: ReplyTimeline(
              replies: replies,
              repliers: repliers,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text("${since}m"),
                          Gaps.h12,
                          GestureDetector(
                            onTap: () => _onEllipsisTap(context),
                            child: Icon(FontAwesomeIcons.ellipsis, size: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  sentence,
                  style: const TextStyle(fontSize: 16),
                ),
                Gaps.v8,
                if (hasImage) ImageCarousel(imageUrls: images),
                Gaps.v12,
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(FontAwesomeIcons.heart),
                      Icon(FontAwesomeIcons.comment),
                      Icon(FontAwesomeIcons.arrowsRotate),
                      Icon(FontAwesomeIcons.paperPlane),
                    ],
                  ),
                ),
                Gaps.v12,
                Text("$replies replies﹒$likes likes"),
              ],
            ),
          ),
          Gaps.h8,
        ],
      ),
    );
  }
}
