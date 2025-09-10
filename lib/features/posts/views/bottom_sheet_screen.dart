import 'package:day15/constants/sizes.dart';
import 'package:day15/features/posts/views/report_screen.dart';
import 'package:day15/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomSheetScreen extends ConsumerWidget {
  const BottomSheetScreen({super.key});

  void _onReportTap(BuildContext context) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) => ReportScreen(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = ref.watch(themeModeProvider).darkMode;
    return SizedBox(
      height: size.height * 0.4,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.075,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: Sizes.size16,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey.shade900 : Colors.black12,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.size20),
                        topRight: Radius.circular(Sizes.size20),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: isDarkMode
                              ? Colors.grey.shade900
                              : Colors.black12,
                          width: 0.8,
                        ),
                      ),
                    ),
                    child: Text(
                      "Unfollow",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.075,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: Sizes.size16,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey.shade900 : Colors.black12,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Sizes.size20),
                        bottomRight: Radius.circular(Sizes.size20),
                      ),
                    ),
                    child: Text(
                      "Mute",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.075,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: Sizes.size16,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey.shade900 : Colors.black12,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.size20),
                        topRight: Radius.circular(Sizes.size20),
                      ),
                      border: Border(
                        bottom: BorderSide(
                            color: isDarkMode
                                ? Colors.grey.shade900
                                : Colors.black12,
                            width: 0.8),
                      ),
                    ),
                    child: Text(
                      "Hide",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onReportTap(context),
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.075,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: Sizes.size16,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode ? Colors.grey.shade900 : Colors.black12,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Sizes.size20),
                          bottomRight: Radius.circular(Sizes.size20),
                        ),
                      ),
                      child: Text(
                        "Report",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
