import 'dart:math';

import 'package:flutter/material.dart';

String getImage() {
  final random = Random();
  return 'https://picsum.photos/300/200?hash=${1000}';
}

// bool isDarkMode(BuildContext context) =>
//     MediaQuery.of(context).platformBrightness == Brightness.dark;
