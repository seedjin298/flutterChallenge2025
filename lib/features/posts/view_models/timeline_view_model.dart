import 'dart:async';

import 'package:day15/features/posts/models/thread_model.dart';
import 'package:day15/features/posts/repos/threads_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadsRepository _repository;
  List<ThreadModel> _list = [];

  Future<List<ThreadModel>> _fetchThreads({
    int? lastItemCreatedAt,
  }) async {
    final result = await _repository.fetchThreads(
      lastItemCreatedAt: lastItemCreatedAt,
    );
    final threads = result.docs.map(
      (doc) => ThreadModel.fromJson(
        json: doc.data(),
        threadId: doc.id,
      ),
    );
    return threads.toList();
  }

  @override
  FutureOr<List<ThreadModel>> build() async {
    _repository = ref.read(threadsRepo);
    _list = await _fetchThreads(lastItemCreatedAt: null);
    return _list;
  }

  Future<void> fetchNextPage() async {
    final nextPage =
        await _fetchThreads(lastItemCreatedAt: _list.last.createdAt);
    state = AsyncValue.data([..._list, ...nextPage]);
  }

  Future<void> refresh() async {
    final threads = await _fetchThreads(lastItemCreatedAt: null);
    _list = threads;
    state = AsyncValue.data(threads);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<ThreadModel>>(
  () => TimelineViewModel(),
);
