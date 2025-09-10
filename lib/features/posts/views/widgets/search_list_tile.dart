import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/settings/view_models/theme_mode_view_model.dart';
import 'package:day15/utils.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchListTile extends ConsumerStatefulWidget {
  const SearchListTile({
    super.key,
  });

  @override
  SearchListTileState createState() => SearchListTileState();
}

class SearchListTileState extends ConsumerState<SearchListTile> {
  bool _isFollowing = false;

  void _onFollowTap() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final userName = faker.internet.userName();
    final followers = random.integer(1000, min: 10);
    final hasAvatar = random.boolean();
    final isDarkMode = ref.watch(themeModeProvider).darkMode;
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
              Text(
                userName,
                style: TextStyle(
                  height: 1.3,
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
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
                    _isFollowing ? "Following" : "Follow",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                      color: _isFollowing
                          ? isDarkMode
                              ? Colors.grey.shade500
                              : Colors.grey.shade400
                          : isDarkMode
                              ? Colors.white
                              : Colors.black,
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
            Gaps.v10,
            Row(
              children: [
                if (hasAvatar) ...[
                  CircleAvatar(
                    foregroundImage: NetworkImage(
                      getImage(),
                    ),
                    radius: 9,
                  ),
                  Gaps.h5,
                ],
                Text(
                  "${followers}K followers",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gaps.v10,
          ],
        ),
      ),
    );
  }
}
