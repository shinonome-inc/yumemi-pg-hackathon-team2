import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/model/share_favor_request.dart';
import 'package:app/repository/favor_repository.dart';

part 'share_favor_uploader.g.dart';

@riverpod
class ShareFavorUploader extends _$ShareFavorUploader {
  @override
  Future<void> build() async {}

  Future<void> upload(ShareFavorRequest request) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(favorRepositoryProvider);
      await repo.postShareFavor(request);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
