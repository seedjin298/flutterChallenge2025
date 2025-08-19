import 'dart:math';

import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScroll extends StatelessWidget {
  final String nickname;
  final String? postText;
  final String postTime;
  final String replyText;
  final String likeText;
  final bool isText;
  final bool isCheck;
  final bool isThreeCircle;

  const PostScroll({
    super.key,
    required this.nickname,
    required this.isCheck,
    required this.postTime,
    required this.isThreeCircle,
    required this.replyText,
    required this.likeText,
    required this.isText,
    this.postText,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    return Container(
      width: baseSize.width,
      padding: EdgeInsets.only(
        left: Sizes.size14,
        top: Sizes.size20,
        bottom: Sizes.size20,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.3,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: Sizes.size20,
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          child: FaIcon(
                            FontAwesomeIcons.user,
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          right: -3,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size3,
                              vertical: Sizes.size2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.white,
                                width: Sizes.size3,
                              ),
                              borderRadius: BorderRadius.circular(Sizes.size36),
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: Sizes.size14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v10,
                    Expanded(
                      child: Container(
                        width: Sizes.size2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Gaps.v10,
                  ],
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                nickname,
                                style: TextStyle(
                                  height: 1,
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (isCheck) ...[
                                Gaps.h5,
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: Theme.of(context).primaryColor,
                                  size: Sizes.size12 + Sizes.size1,
                                ),
                              ]
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                postTime,
                                style: TextStyle(
                                  height: 1,
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Gaps.h14,
                              FaIcon(
                                FontAwesomeIcons.ellipsis,
                                size: Sizes.size12 + Sizes.size1,
                              ),
                              Gaps.h14,
                            ],
                          ),
                        ],
                      ),
                      Gaps.v4,
                      if (isText)
                        SizedBox(
                          width: baseSize.width * 0.8,
                          child: Text(
                            postText!,
                            style: TextStyle(
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      Gaps.v10,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: Sizes.size10,
                          children: [
                            Container(
                              width: baseSize.width * 0.8,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size20,
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/horizontal.png',
                                scale: 16 / 9,
                              ),
                            ),
                            Container(
                              width: baseSize.width * 0.8,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size20,
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/horizontal.png',
                                scale: 16 / 9,
                              ),
                            ),
                            Container(
                              width: baseSize.width * 0.8,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size20,
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/horizontal.png',
                                scale: 16 / 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v18,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: Sizes.size20,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20 + Sizes.size2,
                          ),
                          Transform.flip(
                            flipX: true,
                            child: FaIcon(
                              FontAwesomeIcons.comment,
                              size: Sizes.size20 + Sizes.size2,
                            ),
                          ),
                          Transform.rotate(
                            angle: pi / 2,
                            child: FaIcon(
                              FontAwesomeIcons.retweet,
                              size: Sizes.size20 + Sizes.size2,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: Sizes.size20 + Sizes.size2,
                          ),
                        ],
                      ),
                      Gaps.v16,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isThreeCircle
                  ? SizedBox(
                      height: Sizes.size40,
                      width: Sizes.size40,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 0,
                            child: CircleAvatar(
                              radius: Sizes.size10,
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              child: FaIcon(
                                FontAwesomeIcons.user,
                                size: Sizes.size10,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            child: CircleAvatar(
                              radius: Sizes.size8,
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              child: FaIcon(
                                FontAwesomeIcons.user,
                                size: Sizes.size8,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: CircleAvatar(
                              radius: Sizes.size6,
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              child: FaIcon(
                                FontAwesomeIcons.user,
                                size: Sizes.size6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: Sizes.size24,
                      width: Sizes.size32,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              radius: Sizes.size9,
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              child: FaIcon(
                                FontAwesomeIcons.user,
                                size: Sizes.size9,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: Sizes.size3,
                                ),
                                borderRadius:
                                    BorderRadius.circular(Sizes.size32),
                              ),
                              child: CircleAvatar(
                                radius: Sizes.size9,
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                child: FaIcon(
                                  FontAwesomeIcons.user,
                                  size: Sizes.size9,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              Gaps.h10,
              Text(
                "$replyText replies · $likeText likes",
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
