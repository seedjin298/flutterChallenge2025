import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/view_models/signup_view_model.dart';
import 'package:day15/features/authentication/views/confirmation_code_screen.dart';
import 'package:day15/features/onboarding/customize_experience_screen.dart';
import 'package:day15/features/authentication/views/widgets/account_text_input.dart';
import 'package:day15/features/authentication/views/widgets/move_screen_button.dart';
import 'package:day15/features/authentication/views/widgets/screen_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static final routeUrl = "/signin";
  static final routeName = "signUp";

  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _socialMediaController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  final FocusNode _dateFocusNode = FocusNode();

  bool _isDateTapped = false;
  bool _isPickerVisible = false;
  bool _isAgreed = false;

  DateTime initialDate = DateTime.now();

  Map<String, String> formData = {};

  void _onScaffoldTap() {
    _isDateTapped = false;
    FocusScope.of(context).unfocus();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = DateFormat('MMMM d, y').format(date);
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _showDatePicker() {
    setState(() {
      _isPickerVisible = true;
    });
    showCupertinoModalPopup(
      barrierColor: Colors.transparent,
      context: context,
      builder: (_) => SizedBox(
        height: 300,
        child: CupertinoDatePicker(
          maximumDate: initialDate,
          initialDateTime: initialDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
        ),
      ),
    ).then((_) {
      _isPickerVisible = false;
    });
  }

  void _onNextTapped(BuildContext context) async {
    if (_formKey.currentState != null) {
      if (!(_usernameController.text.isEmpty ||
          _birthdayController.text.isEmpty ||
          _socialMediaController.text.isEmpty)) {
        _formKey.currentState!.save();
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomizeExperienceScreen(),
          ),
        );
        if (result != null) {
          _isAgreed = result;
        }
      }
    }
  }

  void _onSignUpTap() {
    ref.read(signUpForm.notifier).state = {
      "email": formData["Phone number or email address"]
    };
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmationCodeScreen(
          email: formData["Phone number or email address"],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
    _dateFocusNode.addListener(() {
      setState(() {
        if (_dateFocusNode.hasFocus) {
          _isDateTapped = true;
        } else {
          _isDateTapped = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenTitle(
                text: "Create your account",
              ),
              Gaps.v40,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AccountTextInput(
                      controller: _usernameController,
                      text: "Name",
                      formData: formData,
                    ),
                    Gaps.v40,
                    AccountTextInput(
                      controller: _socialMediaController,
                      text: "Phone number or email address",
                      formData: formData,
                    ),
                    Gaps.v40,
                    Column(
                      children: [
                        TextFormField(
                          readOnly: true,
                          focusNode: _dateFocusNode,
                          onTap: _showDatePicker,
                          controller: _birthdayController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData["birthday"] = newValue;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Date of birth",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            suffix: Opacity(
                              opacity: _birthdayController.text.isEmpty ? 0 : 1,
                              child: FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v8,
                        AnimatedOpacity(
                          opacity: _isDateTapped || _isPickerVisible ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                            style: TextStyle(
                              fontSize: Sizes.size15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v60,
                    if (!_isAgreed)
                      GestureDetector(
                        onTap: () => _onNextTapped(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.size20,
                            vertical: Sizes.size10,
                          ),
                          decoration: BoxDecoration(
                            color: _usernameController.text.isEmpty ||
                                    _birthdayController.text.isEmpty ||
                                    _socialMediaController.text.isEmpty
                                ? Colors.grey.shade500
                                : Colors.black,
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
              if (_isAgreed) ...[
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
                      TextSpan(
                        text:
                            ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise ",
                      ),
                      TextSpan(
                        text: "here",
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
                Gaps.v16,
                GestureDetector(
                  onTap: _onSignUpTap,
                  child: MoveScreenButton(
                    text: "Sign up",
                    disabled: false,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
