import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/widgets/move_screen_button.dart';
import 'package:day15/features/authentication/widgets/screen_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isAgreed = false;

  void _onNextTapped(BuildContext context) {
    if (_isAgreed) {
      Navigator.of(context).pop(_isAgreed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
        ),
        leadingWidth: Sizes.size100,
        leading: GestureDetector(
          onTap: () => {Navigator.of(context).pop()},
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Cancel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          children: [
            ScreenTitle(
              text: "Customize your experience",
            ),
            Gaps.v24,
            Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                height: 1.3,
                fontSize: Sizes.size20 + Sizes.size2,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v16,
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CupertinoSwitch(
                  value: _isAgreed,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                )
              ],
            ),
            Gaps.v20,
            RichText(
              text: TextSpan(
                text: "By signing up, you agree to our ",
                style: TextStyle(
                  height: 1.4,
                  fontSize: Sizes.size16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Terms",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ", ",
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ", and ",
                  ),
                  TextSpan(
                    text: "Cookie Use",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text:
                        ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v100,
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size28,
          ),
          child: GestureDetector(
            onTap: () => _onNextTapped(context),
            child: MoveScreenButton(
              text: "Next",
              disabled: !_isAgreed,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
