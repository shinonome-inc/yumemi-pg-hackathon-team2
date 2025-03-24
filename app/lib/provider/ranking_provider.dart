import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/repository/ranking_repository.dart';
import 'package:app/model/ranking_user.dart';

part 'ranking_provider.g.dart';

@riverpod
Future<List<RankingUser>> rankingUsers(Ref ref) async {
  final repo = ref.read(rankingRepositoryProvider);
  return await repo.fetchRanking();
}
