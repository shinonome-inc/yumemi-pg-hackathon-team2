import 'package:app/model/user.dart';
import 'package:app/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userNotifierProvider =
    AutoDisposeAsyncNotifierProvider<UserNotifier, User?>(UserNotifier.new);

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      body: Center(
        child: userState.when(
          data: (user) {
            if (user == null) {
              // ユーザー未作成なら作る
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref
                    .read(userNotifierProvider.notifier)
                    .createUser("sample_name");
              });
              return const Text('ユーザー作成中...');
            } else {
              // ユーザーあり → 次の画面へ遷移など
              // ここでNavigator.pushReplacement(...)してもいい
              return Text('ユーザーID: ${user.userId}, 名前: ${user.username}');
            }
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('エラー: $err'),
        ),
      ),
    );
  }
}
