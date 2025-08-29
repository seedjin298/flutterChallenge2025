import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/posts/widgets/image_carousel.dart';
import 'package:day15/utils.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsersThread extends StatelessWidget {
  final bool isReply;
  const UsersThread({
    super.key,
    required this.isReply,
  });

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final random = RandomGenerator(seed: DateTime.now().millisecondsSinceEpoch);
    final userName = faker.internet.userName();
    final userName2 = faker.internet.userName();
    final sentence = faker.lorem.sentence();
    final replySentence = faker.lorem.sentence();
    final since = random.integer(60);
    final replies = random.integer(1000); // 0~3
    final hasImage = random.integer(3) == 0;
    final images = List.generate(5, (index) => getImage());
    final hasReply = random.integer(3) == 0;
    final isChecked = random.integer(3) == 0;
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          isReply
              ? hasReply
                  ? Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Gaps.v5,
                          CircleAvatar(
                            foregroundImage: NetworkImage(
                              getImage(),
                            ),
                            radius: 24,
                          ),
                          Expanded(
                            child: VerticalDivider(
                              width: Sizes.size32,
                              thickness: 0.5,
                              color: Colors.grey.shade600,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                          CircleAvatar(
                            foregroundImage: NetworkImage(
                              getImage(),
                            ),
                            radius: 24,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Gaps.v5,
                          CircleAvatar(
                            foregroundImage: NetworkImage(
                              getImage(),
                            ),
                            radius: 24,
                          ),
                        ],
                      ),
                    )
              : Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gaps.v5,
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                          getImage(),
                        ),
                        radius: 24,
                      ),
                    ],
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
                          Icon(FontAwesomeIcons.ellipsis, size: 16),
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
                if (hasReply)
                  Container(
                    padding: EdgeInsets.all(Sizes.size10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: NetworkImage(
                                getImage(),
                              ),
                              radius: 10,
                            ),
                            Gaps.h10,
                            Text(
                              userName2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (isChecked) ...[
                              Gaps.h5,
                              Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: Sizes.size12 + Sizes.size1,
                                color: Theme.of(context).primaryColor,
                              ),
                            ]
                          ],
                        ),
                        Gaps.v10,
                        Text(
                          replySentence,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (hasImage) ...[
                          Gaps.v20,
                          ImageCarousel(imageUrls: images)
                        ],
                        Gaps.v20,
                        Text(
                          replies == 1 ? "$replies reply" : "$replies replies",
                        )
                      ],
                    ),
                  ),
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
              ],
            ),
          ),
          Gaps.h8,
        ],
      ),
    );
  }
}
