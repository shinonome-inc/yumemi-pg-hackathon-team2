import 'package:app/model/share_favor.dart';
import 'package:app/repository/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'share_repository.g.dart';

@riverpod
ShareRepository shareRepository(Ref ref) => ShareRepository(ref);

class ShareRepository {
  final Ref ref;
  ShareRepository(this.ref);

  Future<(List<ShareFavor>, String?)> getByCursor(
    String? cursor,
  ) async {
    final apiClient = ref.read(apiClientProvider);
    final response = await apiClient.getByCursor(cursor);
    return (response.items, response.nextCursor);
  }
}
