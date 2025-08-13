import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountTextInput extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final Map<String, String> formData;

  const AccountTextInput({
    super.key,
    required this.text,
    required this.controller,
    required this.formData,
  });

  @override
  State<AccountTextInput> createState() => _AccountTextInputState();
}

class _AccountTextInputState extends State<AccountTextInput> {
  String _userInput = "";
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        _userInput = widget.controller.text;
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: _userInput.isEmpty ? 0 : 1,
          child: Text(
            widget.text,
            style: TextStyle(
              height: 0.01,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) {
            if (newValue != null) {
              widget.formData[widget.text] = newValue;
            }
          },
          decoration: InputDecoration(
            hintText: widget.text,
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
              opacity: _userInput.isEmpty ? 0 : 1,
              child: FaIcon(
                FontAwesomeIcons.solidCircleCheck,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
