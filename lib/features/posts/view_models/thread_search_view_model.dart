import 'dart:async';

import 'package:day15/features/posts/models/thread_model.dart';
import 'package:day15/features/posts/repos/threads_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThreadSearchViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadsRepository _repository;

  List<ThreadModel> _list = [];

  @override
  FutureOr<List<ThreadModel>> build() {
    _repository = ref.read(threadsRepo);
    return _list;
  }

  Future<List<ThreadModel>> searchThreads(String keyword) async {
    List<ThreadModel> creator = [];
    List<ThreadModel> sentence = [];
    final creatorResult = await _repository.searchCreatorThreads(keyword);
    final sentenceResult = await _repository.searchSentenceThreads(keyword);
    creator = creatorResult.docs
        .map(
          (doc) => ThreadModel.fromJson(
            json: doc.data(),
            threadId: doc.id,
          ),
        )
        .toList();
    sentence = sentenceResult.docs
        .map(
          (doc) => ThreadModel.fromJson(
            json: doc.data(),
            threadId: doc.id,
          ),
        )
        .toList();
    _list = [...creator, ...sentence];
    return _list;
  }
}

final threadSearchProvider =
    AsyncNotifierProvider<ThreadSearchViewModel, List<ThreadModel>>(
  () => ThreadSearchViewModel(),
);
