import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/views/password_screen.dart';
import 'package:day15/features/authentication/views/widgets/code_digit_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({
    super.key,
    required this.email,
  });
  final String? email;

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();

  List<String> formData = [];
  bool _isValidated = false;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  void _onNextTap() {
    if (formData.length == 6) {
      setState(() {
        _isValidated = true;
      });
      Future.delayed(Duration(seconds: 1), () {
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PasswordScreen(),
            ),
          );
        }
      });
    }
  }

  void _onBackTap() {
    Navigator.of(context).pop();
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
          leading: GestureDetector(
            onTap: _onBackTap,
            child: Container(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: Sizes.size20,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v20,
                    Text(
                      "We sent you a code",
                      style: TextStyle(
                        height: 1.3,
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Enter it below to verify",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${widget.email ?? "jhon.mobbin@gmail.com"}.",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gaps.v40,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CodeDigitForm(
                          myFocusNode: _focusNode1,
                          nextFocusNode: _focusNode2,
                          formData: formData,
                          isEnd: false,
                        ),
                        CodeDigitForm(
                          myFocusNode: _focusNode2,
                          nextFocusNode: _focusNode3,
                          formData: formData,
                          isEnd: false,
                        ),
                        CodeDigitForm(
                          myFocusNode: _focusNode3,
                          nextFocusNode: _focusNode4,
                          formData: formData,
                          isEnd: false,
                        ),
                        CodeDigitForm(
                          myFocusNode: _focusNode4,
                          nextFocusNode: _focusNode5,
                          formData: formData,
                          isEnd: false,
                        ),
                        CodeDigitForm(
                          myFocusNode: _focusNode5,
                          nextFocusNode: _focusNode6,
                          formData: formData,
                          isEnd: false,
                        ),
                        CodeDigitForm(
                          myFocusNode: _focusNode6,
                          nextFocusNode: _focusNode7,
                          formData: formData,
                          isEnd: true,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    AnimatedOpacity(
                      opacity: _isValidated ? 1 : 0,
                      duration: Duration(milliseconds: 100),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.green,
                          size: Sizes.size32,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: Sizes.size40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Didn't receive email?",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Gaps.v14,
                      GestureDetector(
                        onTap: _onNextTap,
                        child: AnimatedContainer(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: Sizes.size56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: formData.length == 6
                                ? Colors.black
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(Sizes.size32),
                          ),
                          duration: Duration(milliseconds: 300),
                          child: !_isValidated
                              ? Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                )
                              : Transform.scale(
                                  scale: 0.5,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
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
