import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewThreadScreen extends StatefulWidget {
  const NewThreadScreen({super.key});

  @override
  State<NewThreadScreen> createState() => _NewThreadScreenState();
}

class _NewThreadScreenState extends State<NewThreadScreen> {
  final TextEditingController _threadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _thread = "";
  bool _writingThread = false;

  @override
  void initState() {
    super.initState();

    _threadController.addListener(() {
      setState(() {
        _thread = _threadController.text;
      });
    });
  }

  @override
  void dispose() {
    _threadController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _writingThread = false;
    });
  }

  void _onCancelTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Container(
        height: size.height * 0.9,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size20),
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "New thread",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leadingWidth: size.width * 0.2,
            leading: GestureDetector(
              onTap: _onCancelTap,
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            shape: Border(
              bottom: BorderSide(
                color: Colors.black12,
                width: 0.5,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                            getImage(),
                          ),
                          radius: 24,
                        ),
                        Expanded(
                          child: VerticalDivider(
                            width: Sizes.size32,
                            thickness: 0.5,
                            color: Colors.grey.shade600,
                            indent: 10,
                          ),
                        ),
                        Gaps.v10,
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                            getImage(),
                          ),
                          radius: 8,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "jane_mobbin",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _threadController,
                            maxLines: null,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Start a thread...",
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _writingThread = true;
                              });
                            },
                          ),
                          FaIcon(
                            FontAwesomeIcons.paperclip,
                            color: Colors.black38,
                            size: Sizes.size20,
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: Sizes.size10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_writingThread) ...[
                  Text(
                    "Anyone can reply",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      color: Colors.black38,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _thread.isEmpty ? 0.5 : 1,
                    duration: Duration(milliseconds: 200),
                    child: Text(
                      "Post",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
