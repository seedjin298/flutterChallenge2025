import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/widgets/interest_detail_button.dart';
import 'package:day15/features/main_navigation/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const musicInterests1 = [
  "Rap",
  "R&B & soul",
  "Grammy Awards",
  "Rap",
  "R&B & soul",
  "Grammy Awards",
];

const musicInterests2 = [
  "Pop",
  "K-pop",
  "Music industry",
  "ED something",
  "Pop",
  "K-pop",
];

const musicInterests3 = [
  "Music news",
  "Hip hop",
  "Reggae",
  "Music news",
  "Hip hop",
  "Reggae",
];

const entertainmentInterests1 = [
  "Anime",
  "Movies & Tv",
  "Harry Potter",
  "Anime",
  "Movies & Tv",
  "Harry Potter",
];

const entertainmentInterests2 = [
  "Marvel Universe",
  "Movie news",
  "Naruto",
  "Marvel Universe",
  "Movie news",
  "Naruto",
];

const entertainmentInterests3 = [
  "Movies",
  "Grammy Awards",
  "Entertainment",
  "Movies",
  "Grammy Awards",
  "Entertainment",
];

class InterestsDetailScreen extends StatelessWidget {
  const InterestsDetailScreen({super.key});

  void _onBackTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainNavigationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
        ),
        leading: GestureDetector(
          onTap: () => _onBackTap(context),
          child: Container(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: Sizes.size20,
            ),
          ),
        ),
      ),
      body: Column(
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
                Gaps.v14,
                Text(
                  "Interests are used to personalize your experience and will be visible on your profile.",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
                Gaps.v12,
              ],
            ),
          ),
          Divider(),
          Gaps.v18,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Music",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v32,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: Sizes.size8,
                          children:
                              List.generate(musicInterests1.length, (index) {
                            return InterestDetailButton(
                                interest: musicInterests1[index]);
                          }),
                        ),
                        Gaps.v8,
                        Row(
                          spacing: Sizes.size8,
                          children:
                              List.generate(musicInterests2.length, (index) {
                            return InterestDetailButton(
                                interest: musicInterests2[index]);
                          }),
                        ),
                        Gaps.v8,
                        Row(
                          spacing: Sizes.size8,
                          children:
                              List.generate(musicInterests3.length, (index) {
                            return InterestDetailButton(
                                interest: musicInterests3[index]);
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gaps.v18,
          Divider(),
          Gaps.v16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Entertainment",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v32,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: Sizes.size8,
                          children: List.generate(
                              entertainmentInterests1.length, (index) {
                            return InterestDetailButton(
                                interest: entertainmentInterests1[index]);
                          }),
                        ),
                        Gaps.v8,
                        Row(
                          spacing: Sizes.size8,
                          children: List.generate(
                              entertainmentInterests2.length, (index) {
                            return InterestDetailButton(
                                interest: entertainmentInterests2[index]);
                          }),
                        ),
                        Gaps.v8,
                        Row(
                          spacing: Sizes.size8,
                          children: List.generate(
                              entertainmentInterests3.length, (index) {
                            return InterestDetailButton(
                                interest: entertainmentInterests3[index]);
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
          ),
        ),
        child: BottomAppBar(
          height: Sizes.size60,
          elevation: 1,
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => _onNextTap(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
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
      ),
    );
  }
}
