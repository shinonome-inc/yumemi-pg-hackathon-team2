import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/repository/api_client.dart';
import 'package:app/model/ranking_user.dart';

part 'ranking_repository.g.dart';

@riverpod
RankingRepository rankingRepository(Ref ref) => RankingRepository(ref);

class RankingRepository {
  RankingRepository(this.ref);
  final Ref ref;

  Future<List<RankingUser>> fetchRanking() {
    final api = ref.read(apiClientProvider);
    return api.fetchRankingUsers();
  }
}
