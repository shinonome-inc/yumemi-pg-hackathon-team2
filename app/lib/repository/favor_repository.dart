import 'package:app/model/share_favor_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/repository/api_client.dart';

part 'favor_repository.g.dart';

@riverpod
FavorRepository favorRepository(Ref ref) => FavorRepository(ref);

class FavorRepository {
  FavorRepository(this.ref);
  final Ref ref;

  Future<void> updateFavorCounts({
    required int userId,
    required int receivedFavorCount,
    required int repaidFavorCount,
  }) async {
    final api = ref.read(apiClientProvider);
    await api.updateFavorCounts(
      userId: userId,
      receivedFavorCount: receivedFavorCount,
      repaidFavorCount: repaidFavorCount,
    );
  }

  Future<void> postShareFavor(ShareFavorRequest request) async {
    final api = ref.read(apiClientProvider);
    await api.postShareFavor(request);
  }
}
