import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/posts/widgets/post.dart';
import 'package:day15/features/posts/widgets/post_scroll.dart';
import 'package:day15/features/posts/widgets/post_vertical.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostsTimelineScreen extends StatelessWidget {
  const PostsTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Column(
          children: [
            FaIcon(
              FontAwesomeIcons.twitter,
              size: Sizes.size44,
              color: Theme.of(context).primaryColor,
            ),
            Gaps.v20,
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Post(
              nickname: "pubity",
              isCheck: true,
              isText: true,
              postText: "Vine after seeing the Threads logo unveiled",
              postTime: "2m",
              isThreeCircle: true,
              isImage: true,
              isImageHorizontalLong: true,
              replyText: "36",
              likeText: "391",
              isMute: true,
            ),
            Post(
              nickname: "thetinderblog",
              isCheck: false,
              isText: true,
              postText: "Elon alone on Twitter right now...",
              postTime: "5m",
              isThreeCircle: true,
              isImage: true,
              isImageHorizontalLong: true,
              replyText: "59",
              likeText: "617",
              isMute: false,
            ),
            Post(
              nickname: "tropicalseductions",
              isCheck: true,
              isText: true,
              postText: "Drop a comment here to test things out",
              postTime: "2h",
              isThreeCircle: false,
              isImage: false,
              replyText: "2",
              likeText: "4",
              isMute: false,
            ),
            Post(
              nickname: "shityoushouldcareabout",
              isCheck: true,
              isText: true,
              postText:
                  "my phone feels like a vibrator with all these notifications rn",
              postTime: "2h",
              isThreeCircle: true,
              isImage: false,
              replyText: "64",
              likeText: "631",
              isMute: false,
            ),
            Post(
              nickname: "_plantswithkrystal",
              isCheck: true,
              isText: true,
              postText:
                  "If you're reading this, go water that thirsty plant. You're welcome ☺️",
              postTime: "2h",
              isThreeCircle: true,
              isImage: false,
              replyText: "8",
              likeText: "74",
              isMute: false,
            ),
            Post(
              nickname: "terracottacoco",
              isCheck: true,
              isText: false,
              postTime: "2h",
              isThreeCircle: true,
              isImage: true,
              isImageHorizontalLong: true,
              replyText: "12",
              likeText: "32",
              isMute: false,
            ),
            PostVertical(
              nickname: "randomguypassingby",
              isCheck: true,
              isText: false,
              postTime: "5h",
              isThreeCircle: true,
              isImage: true,
              replyText: "23",
              likeText: "325",
              isMute: true,
            ),
            PostScroll(
              nickname: "timferriss",
              isCheck: true,
              isText: true,
              postText: "Photoshoot with Molly pup. :)",
              postTime: "7h",
              isThreeCircle: true,
              replyText: "53",
              likeText: "437",
            ),
          ],
        ),
      ),
    );
  }
}
