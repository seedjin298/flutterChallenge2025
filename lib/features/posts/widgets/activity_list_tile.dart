import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/utils.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityListTile extends StatefulWidget {
  const ActivityListTile({super.key});

  @override
  State<ActivityListTile> createState() => _ActivityListTileState();
}

class _ActivityListTileState extends State<ActivityListTile> {
  bool _isFollowing = random.boolean();

  void _onFollowTap() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final faker = Faker();
    final userName = faker.internet.userName();
    final sentence = faker.lorem.sentence();
    final sentence2 = faker.lorem.sentence();
    final isSubtitle = random.boolean();
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      contentPadding: EdgeInsets.only(left: Sizes.size20),
      leading: CircleAvatar(
        foregroundImage: NetworkImage(
          getImage(),
        ),
        radius: 20,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      height: 1.3,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              SizedBox(
                width: _isFollowing ? size.width * 0.4 : size.width * 0.7,
                child: Text(
                  sentence,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (_isFollowing)
                GestureDetector(
                  onTap: _onFollowTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size5,
                      horizontal: Sizes.size24,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(
                        Sizes.size8,
                      ),
                    ),
                    child: Text(
                      "Following",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                        color:
                            _isFollowing ? Colors.grey.shade400 : Colors.black,
                      ),
                    ),
                  ),
                ),
              Gaps.h20,
            ],
          ),
        ],
      ),
      subtitle: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isSubtitle)
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                  sentence2,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Gaps.v10,
          ],
        ),
      ),
    );
  }
}
