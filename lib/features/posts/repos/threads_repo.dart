import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day15/features/posts/models/thread_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreadsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadPostImage(File image, String uid) {
    final fileRef = _storage.ref().child(
          "/images/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}",
        );
    return fileRef.putFile(image);
  }

  Future<void> saveThread(ThreadModel data) async {
    await _db.collection("threads").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchThreads({
    int? lastItemCreatedAt,
  }) {
    final query = _db
        .collection("threads")
        .orderBy("createdAt", descending: true)
        .limit(5);
    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }
}

final threadsRepo = Provider(
  (ref) => ThreadsRepository(),
);
