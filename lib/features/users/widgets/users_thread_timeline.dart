import 'package:day15/constants/gaps.dart';
import 'package:day15/features/users/widgets/users_thread.dart';
import 'package:flutter/material.dart';

class UsersThreadTimeline extends StatelessWidget {
  const UsersThreadTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.v10,
        UsersThread(
          isReply: false,
        ),
        Gaps.v10,
        Divider(),
      ],
    );
  }
}
