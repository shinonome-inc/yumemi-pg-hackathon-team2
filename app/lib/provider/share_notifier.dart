import 'package:app/model/share_favor.dart';
import 'package:app/repository/share_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

part 'share_notifier.g.dart';

@riverpod
class ShareNotifier extends _$ShareNotifier
    with CursorPagingNotifierMixin<ShareFavor> {
  /// Builds the initial state of the provider by fetching data with a null cursor.
  @override
  Future<CursorPagingData<ShareFavor>> build() => fetch(cursor: null);
  @override
  Future<CursorPagingData<ShareFavor>> fetch({
    required String? cursor,
  }) async {
    final repository = ref.read(shareRepositoryProvider);
    final (items, nextCursor) = await repository.getByCursor(cursor);
    final hasMore = nextCursor != null && nextCursor.isNotEmpty;

    return CursorPagingData(
      items: items,
      hasMore: hasMore,
      nextCursor: nextCursor,
    );
  }
}
