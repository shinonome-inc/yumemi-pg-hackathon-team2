import 'package:app/provider/share_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//setting_pageはなくすかも

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Flutter Hooksによる状態（Local State）を取得
    final home = useState(0);
    // Riverpodによる状態（App State）を取得
    final homeState = ref.watch(shareNotifierProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Setting Page'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(home.value.toString()),
              TextButton(
                onPressed: () => home.value++,
                child: const Text("Increment Hooks"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
