import 'package:app/provider/repaid_favor_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/repository/favor_repository.dart';
import 'package:app/provider/received_favor_notifier.dart';
import 'package:app/provider/user_notifier.dart';

part 'favor_count_updater.g.dart';

@riverpod
class FavorCountUpdater extends _$FavorCountUpdater {
  @override
  Future<void> build() async {}

  Future<void> updateFavorCounts() async {
    state = const AsyncLoading();

    try {
      final user = ref.read(userNotifierProvider).value;
      if (user == null) {
        throw Exception('ユーザー情報が存在しません');
      }

      final receivedCount = await ref
          .read(receivedFavorNotifierProvider.notifier)
          .getReceivedFavorCount();
      final repaidCount = await ref
          .read(repaidFavorNotifierProvider.notifier)
          .getRepaidFavorCount();

      debugPrint(("repaidCount: $repaidCount"));
      debugPrint(("receivedCount: $receivedCount"));

      final repo = ref.read(favorRepositoryProvider);
      await repo.updateFavorCounts(
        userId: user.userId,
        receivedFavorCount: receivedCount,
        repaidFavorCount: repaidCount,
      );

      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
