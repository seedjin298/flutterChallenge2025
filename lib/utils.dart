import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String getImage() {
  final random = Random();
  return 'https://picsum.photos/300/200?hash=${1000}';
}

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(
          (error as FirebaseException).message ?? "Something wen't wrong."),
    ),
  );
}
