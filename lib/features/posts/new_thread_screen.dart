import 'dart:io';

import 'package:camera/camera.dart';
import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/posts/camera_screen.dart';
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

  late List<XFile> _images;
  bool _isImage = false;
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

  void _onPostTap() async {
    final images = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraScreen(),
      ),
    );
    if (images != null) {
      _images = images;
      _isImage = _images.isNotEmpty;
      setState(() {});
    }
  }

  void _imageDelete(XFile image) {
    _images.remove(image);
    _isImage = _images.isNotEmpty;
    setState(() {});
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size16,
                bottom: Sizes.size16,
                right: Sizes.size16,
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
                            if (_isImage)
                              for (var image in _images)
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size16),
                                          child: Image.file(
                                            File(image.path),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: IconButton(
                                            onPressed: () =>
                                                _imageDelete(image),
                                            icon: Icon(
                                              FontAwesomeIcons.solidCircleXmark,
                                              color: Colors.black38,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gaps.v20,
                                  ],
                                ),
                            GestureDetector(
                              onTap: _onPostTap,
                              child: FaIcon(
                                FontAwesomeIcons.paperclip,
                                color: Colors.black38,
                                size: Sizes.size20,
                              ),
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
