import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/model/user.dart';
import 'package:app/repository/user_repository.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<User?> build() async {
    final repo = ref.read(userRepositoryProvider);
    return await repo.loadUser();
  }

  /// ローディング中にユーザーを作成して保存するメソッド
  Future<void> createUser(String username) async {
    // 通信や保存に時間がかかるので、一旦 loading 状態に
    state = const AsyncValue.loading();

    try {
      final repo = ref.read(userRepositoryProvider);
      final user = await repo.createUser(username);
      // 成功したら user を通知
      state = AsyncValue.data(user);
    } catch (e, st) {
      // エラー時
      state = AsyncValue.error(e, st);
    }
  }
}
