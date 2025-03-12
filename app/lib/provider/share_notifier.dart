import 'package:app/model/share_favor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'share_notifier.g.dart';

@Riverpod(keepAlive: true)
class ShareNotifier extends _$ShareNotifier {
  @override
  Future<ShareFavor> build() async {
    return ShareFavor(
      userId: 'user1',
      id: 'id1',
      receivedFavorText: 'receivedFavorText1',
      eceivedFavorDate: DateTime.now(),
      repaidFavorText: 'repaidFavorText1',
      repaiedFavorDate: DateTime.now(),
    );
  }

  // void increment() {
  //   state = state + 1;
  // }
}

// @riverpod
// class CounterNotifier extends _$CounterNotifier {
//   @override
//   Future<int> build() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return 0;
//   }
//   // 省略
// }
