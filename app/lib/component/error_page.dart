import 'package:app/constants/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorView extends ConsumerWidget {
  final Object err;
  final StackTrace? stack;
  final void Function()? debugCallback;

  /// リトライ対象となる Provider を受け取る
  final ProviderBase provider;

  const ErrorView({
    super.key,
    required this.err,
    required this.provider,
    this.stack,
    this.debugCallback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundOrange,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'エラーが発生しました',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(provider);
                  },
                  child: const Text('タップして再試行'),
                ),
                if (kDebugMode)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: debugCallback,
                      child: const Text('続行（デバッグ用）'),
                    ),
                  ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
