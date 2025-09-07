import 'dart:async';

import 'package:day15/features/authentication/repo/authentication_repo.dart';
import 'package:day15/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends AsyncNotifier {
  late final AuthenticationRepository _repository;
  @override
  FutureOr build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repository.signIn(email, password),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(
        context,
        state.error,
      );
    } else {
      context.go("/home");
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
