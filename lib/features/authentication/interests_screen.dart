import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/interests_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<int> _checkedIndex = [];
  final Duration _duration = Duration(milliseconds: 300);

  final List<String> _interests = [
    "Fashion & beauty",
    "Outdoors",
    'Arts & culture',
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
  ];

  void _onInterestTapped(int index) {
    if (_checkedIndex.contains(index)) {
      _checkedIndex.remove(index);
      setState(() {});
    } else {
      if (_checkedIndex.length < 3) {
        _checkedIndex.add(index);
        setState(() {});
      }
    }
  }

  void _onNextTap() {
    if (_checkedIndex.length == 3) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InterestsDetailScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              children: [
                Text(
                  "What do you want to see on Twitter?",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v16,
                Text(
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
                Gaps.v14,
              ],
            ),
          ),
          Divider(),
          Gaps.v32,
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 2.5 / 1,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => _onInterestTapped(index),
                child: AnimatedContainer(
                  padding: EdgeInsets.only(
                    right: Sizes.size12,
                    left: Sizes.size12,
                    bottom: Sizes.size6,
                    top: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    color: _checkedIndex.contains(index)
                        ? Theme.of(context).primaryColor
                        : null,
                    border: Border.all(
                      color: _checkedIndex.contains(index)
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade500,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: Duration(milliseconds: 100),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Text(
                          _interests[index % 10],
                          style: TextStyle(
                            color: _checkedIndex.contains(index)
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (_checkedIndex.contains(index))
                        Positioned(
                          right: 0,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            size: Sizes.size16,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size60,
        elevation: 1,
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _checkedIndex.length == 3
                  ? "Great work!"
                  : "${_checkedIndex.length} of 3 selected",
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
            GestureDetector(
              onTap: _onNextTap,
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size10,
                ),
                decoration: BoxDecoration(
                  color: _checkedIndex.length == 3
                      ? Colors.black
                      : Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(30),
                ),
                duration: _duration,
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
