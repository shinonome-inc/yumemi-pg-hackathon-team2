import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'share_notifier.g.dart';

@Riverpod(keepAlive: true)
class ShareNotifier extends _$ShareNotifier {
  @override
  int build() => 0;

  void increment() {
    state = state + 1;
  }
}
