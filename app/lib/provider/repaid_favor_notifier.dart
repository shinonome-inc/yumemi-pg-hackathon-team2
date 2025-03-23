import 'package:app/model/repaid_favor.dart';
import 'package:app/repository/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repaid_favor_notifier.g.dart';

@riverpod
class RepaidFavorNotifier extends _$RepaidFavorNotifier {
  final _storage = SharedPreferencesClient();

  @override
  Future<List<RepaidFavor>> build() async {
    return await _storage.loadRepaidFavors();
  }

  Future<void> addRepaidFavor(RepaidFavor favor) async {
    final currentFavors = await _storage.loadRepaidFavors();
    final newFavors = [...currentFavors, favor];
    await _storage.saveRepaidFavors(newFavors);
    state = AsyncData(newFavors);
  }

  Future<void> removeRepaidFavor(String id) async {
    final currentFavors = await _storage.loadRepaidFavors();
    final newFavors = currentFavors.where((favor) => favor.id != id).toList();
    await _storage.saveRepaidFavors(newFavors);
    state = AsyncData(newFavors);
  }

  Future<void> clearAllRepaidFavors() async {
    await _storage.clearRepaidFavors();
    state = AsyncData([]);
  }

  Future<int> getRepaidFavorCount() async {
    final currentFavors = await _storage.loadRepaidFavors();
    return currentFavors.length;
  }
}
