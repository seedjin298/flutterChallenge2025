import 'package:day15/constants/gaps.dart';
import 'package:day15/features/users/widgets/users_thread.dart';
import 'package:flutter/material.dart';

class UsersReplyTimeline extends StatelessWidget {
  const UsersReplyTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.v10,
        UsersThread(
          isReply: true,
        ),
        Gaps.v10,
        Divider(),
      ],
    );
  }
}
