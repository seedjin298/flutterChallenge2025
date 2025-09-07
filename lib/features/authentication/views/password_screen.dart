import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/view_models/signup_view_model.dart';
import 'package:day15/features/authentication/views/widgets/move_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  PasswordScreenState createState() => PasswordScreenState();
}

class PasswordScreenState extends ConsumerState<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  bool _isPasswordValid(String? value) {
    return value != null && value.length >= 8;
  }

  bool _obscureText = true;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onNextTapped() {
    if (_formData['password'] != null &&
        _isPasswordValid(_formData["password"])) {
      final state = ref.read(signUpForm.notifier).state;
      ref.read(signUpForm.notifier).state = {
        ...state,
        "password": _formData['password']
      };
      ref.read(signUpProvider.notifier).signUp(context);
      // context.goNamed(InterestsScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v20,
                Text(
                  "You'll need a password",
                  style: TextStyle(
                    height: 1.3,
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v16,
                Text(
                  "Make sure it's 8 characters or more.",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gaps.v20,
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _formData['password'] = value;
                    });
                  },
                  validator: (value) {
                    if (value != null && (value.isEmpty || value.length < 8)) {
                      return "Password should be 8 characters or more.";
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        if (_formData['password'] != null &&
                            _isPasswordValid(_formData["password"])) ...[
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.green,
                            size: Sizes.size24,
                          )
                        ],
                      ],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                GestureDetector(
                  onTap: _onNextTapped,
                  child: MoveScreenButton(
                    text: "Next",
                    disabled: !_isPasswordValid(_formData["password"]) ||
                        ref.watch(signUpProvider).isLoading,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
