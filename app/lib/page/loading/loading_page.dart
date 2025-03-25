import 'package:app/component/error_page.dart';
import 'package:app/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      body: userState.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('ユーザー作成中...'));
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/root');
            });
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: ErrorView(
            err: err,
            refreshCallback: () => ref.invalidate(userNotifierProvider),
            stack: stack,
            debugCallback: () {
              Navigator.of(context).pushReplacementNamed('/root');
            },
          ),
        ),
      ),
    );
  }
}
