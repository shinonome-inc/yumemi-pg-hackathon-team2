import 'package:app/model/received_favor.dart';
import 'package:app/repository/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'received_favor_notifier.g.dart';

@riverpod
class ReceivedFavorNotifier extends _$ReceivedFavorNotifier {
  final _storage = SharedPreferencesClient();

  @override
  Future<List<ReceivedFavor>> build() async {
    return await _storage.loadReceivedFavors();
  }

  Future<void> addReceivedFavor(ReceivedFavor favor) async {
    final currentFavors = await _storage.loadReceivedFavors();
    final newFavors = [...currentFavors, favor];
    await _storage.saveReceivedFavors(newFavors);
    state = AsyncData(newFavors);
  }

  Future<void> removeReceivedFavor(String id) async {
    final currentFavors = await _storage.loadReceivedFavors();
    final newFavors = currentFavors.where((favor) => favor.id != id).toList();
    await _storage.saveReceivedFavors(newFavors);
    state = AsyncData(newFavors);
  }

  Future<void> clearAllReceivedFavors() async {
    await _storage.clearReceivedFavors();
    state = AsyncData([]);
  }

  Future<int> getReceivedFavorCount() async {
    final currentFavors = await _storage.loadReceivedFavors();
    return currentFavors.length;
  }
}
