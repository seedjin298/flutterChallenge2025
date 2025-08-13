import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/sign_up_screen.dart';
import 'package:day15/features/authentication/widgets/auth_button.dart';
import 'package:day15/features/authentication/widgets/move_screen_button.dart';
import 'package:day15/features/authentication/widgets/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v120,
            ScreenTitle(
              text: "See what's happening in the world right now.",
            ),
            Gaps.v120,
            AuthButton(
              icon: FaIcon(
                FontAwesomeIcons.google,
                size: Sizes.size20,
              ),
              text: "Continue with Google",
            ),
            Gaps.v12,
            AuthButton(
              icon: FaIcon(
                FontAwesomeIcons.apple,
                size: Sizes.size24,
              ),
              text: "Continue with Apple",
            ),
            Gaps.v12,
            Row(
              spacing: Sizes.size12,
              children: [
                Expanded(child: Divider()),
                Text("or"),
                Expanded(child: Divider()),
              ],
            ),
            Gaps.v6,
            MoveScreenButton(
              onTapped: _onSignUpTap,
              text: "Create account",
              disabled: false,
              color: Colors.black,
            ),
            Gaps.v16,
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
                    text: ".",
                  ),
                ],
              ),
            ),
            Gaps.v80,
            Row(
              spacing: Sizes.size6,
              children: [
                Text(
                  "Have an account already?",
                ),
                Text(
                  "Log in",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
