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
}
