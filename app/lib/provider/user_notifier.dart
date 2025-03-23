import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/model/user.dart';
import 'package:app/repository/user_repository.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  // SharedPreferencesにユーザー情報がなければ作成
  @override
  Future<User?> build() async {
    final repo = ref.read(userRepositoryProvider);

    if (kDebugMode) {
      // デバッグモードなら仮ユーザーを返す
      return User(userId: 'debug-id', username: 'デバッグ君');
    }

    final existingUser = await repo.loadUser();
    if (existingUser != null) {
      return existingUser;
    }

    final newUser = await repo.createUser('名無し');
    return newUser;
  }

  Future<void> createUser(String username) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userRepositoryProvider);
      final user = await repo.createUser(username);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUsername(String newUsername) async {
    final repo = ref.read(userRepositoryProvider);
    final current = state.value;

    if (current == null) return;

    state = const AsyncValue.loading();
    try {
      final updatedUser = await repo.updateUser(current.userId, newUsername);
      state = AsyncValue.data(updatedUser);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
