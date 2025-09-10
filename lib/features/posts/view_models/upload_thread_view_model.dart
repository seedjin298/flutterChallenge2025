import 'dart:async';
import 'dart:io';

import 'package:day15/features/authentication/repo/authentication_repo.dart';
import 'package:day15/features/posts/models/thread_model.dart';
import 'package:day15/features/posts/repos/threads_repo.dart';
import 'package:day15/features/users/view_models/users_view_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UploadThreadViewModel extends AsyncNotifier<void> {
  late final ThreadsRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(threadsRepo);
  }

  Future<void> uploadThread(
    File? image,
    String sentence,
    BuildContext context,
  ) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        late final TaskSnapshot task;
        if (image != null) {
          task = await _repository.uploadPostImage(
            image,
            user!.uid,
          );
        }
        if (image == null || task.metadata != null) {
          await _repository.saveThread(
            ThreadModel(
              id: "",
              sentence: sentence,
              imageUrl: image == null ? "" : await task.ref.getDownloadURL(),
              creatorUid: user!.uid,
              creator: "anonymous",
              repliers: [],
              likes: 0,
              replies: 0,
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
          context.pushReplacement("/home");
        }
      });
    }
  }
}

final uploadThreadProvider = AsyncNotifierProvider<UploadThreadViewModel, void>(
  () => UploadThreadViewModel(),
);
