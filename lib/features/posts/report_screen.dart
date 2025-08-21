import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<String> _reportElements = [
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
];

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.7,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          notificationPredicate: (_) => false,
          title: Text(
            "Report",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 0.5,
            ),
          ),
        ),
        body: ListView(
          children: [
            Gaps.v10,
            Column(
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Why are you reporting this thread?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.v10,
                      Text(
                        "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                        style: TextStyle(
                          height: 1.2,
                          fontSize: Sizes.size14,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.v20,
            for (var reportElement in _reportElements)
              reportElement == _reportElements[0]
                  ? ListTile(
                      shape: Border(
                        top: BorderSide(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                        bottom: BorderSide(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                      ),
                      title: Text(
                        reportElement,
                      ),
                      trailing: FaIcon(
                        FontAwesomeIcons.chevronRight,
                      ),
                    )
                  : ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                      ),
                      title: Text(
                        reportElement,
                      ),
                      trailing: FaIcon(
                        FontAwesomeIcons.chevronRight,
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
