import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeDigitForm extends StatefulWidget {
  const CodeDigitForm({
    super.key,
    required this.myFocusNode,
    required this.nextFocusNode,
    required this.formData,
    required this.isEnd,
  });

  final FocusNode myFocusNode;
  final FocusNode nextFocusNode;
  final List<String> formData;
  final bool isEnd;

  @override
  State<CodeDigitForm> createState() => _CodeDigitFormState();
}

class _CodeDigitFormState extends State<CodeDigitForm> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.size40,
      child: TextFormField(
        controller: _inputController,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        maxLength: 1,
        focusNode: widget.myFocusNode,
        showCursor: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.numberWithOptions(),
        style: TextStyle(
          fontSize: Sizes.size24,
          fontWeight: FontWeight.w800,
        ),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.only(
            bottom: Sizes.size16,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.5),
          ),
        ),
        // onTap: _onTap,
        onChanged: (value) {
          setState(() {
            widget.formData.add(value);
          });
          if (value.length == 1) {
            if (!widget.isEnd) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            } else {
              FocusScope.of(context).unfocus();
            }
          }
        },
      ),
    );
  }
}
