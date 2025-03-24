import 'package:app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/provider/user_notifier.dart';

/// TODO:エラー時のトーストの挙動を修正

class UsernameEditPage extends HookConsumerWidget {
  const UsernameEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final notifier = ref.read(userNotifierProvider.notifier);
    final controller = useTextEditingController(
      text: userState.value?.userName ?? '',
    );
    final isButtonEnabled = useState(controller.text.trim().isNotEmpty);

    // 入力変化によるボタン制御
    useEffect(() {
      void listener() {
        isButtonEnabled.value = controller.text.trim().isNotEmpty;
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    // エラーがあればSnackBar表示
    useEffect(() {
      if (userState.hasError) {
        final error = userState.error;
        debugPrint('Error: $error');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('エラー：再度更新してください')),
          );
        });
      }
      return null;
    }, [userState]);

    Future<void> onUpdate() async {
      final newName = controller.text.trim();
      if (newName.isEmpty) return;

      await notifier.updateUsername(newName);

      if (!ref.read(userNotifierProvider).hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ニックネームを更新しました')),
        );
      }
    }

    return Scaffold(
      backgroundColor:AppColors.backgroundOrange,
      appBar: AppBar(
        title: const Text(
          'ニックネームの更新',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.backgroundOrange,
        elevation: 0,
        foregroundColor: AppColors.textBlack,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ニックネームを設定してください',
              style: TextStyle(color:AppColors.primary, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              cursorColor:AppColors.primary,
              cursorWidth: 2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintText: 'ニックネーム',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '名前が公開されます。',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE98658),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isButtonEnabled.value ? onUpdate : null,
                child: const Text(
                  '更新する',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
