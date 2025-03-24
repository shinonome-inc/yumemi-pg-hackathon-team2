import 'package:app/constants/app_colors.dart';
import 'package:app/page/setting/username_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/provider/user_notifier.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final username = userState.value?.userName ?? '名無し';

    return Scaffold(
      backgroundColor: AppColors.backgroundOrange,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundOrange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '設定',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _SettingTile(
              title: 'ニックネーム',
              trailing: Text(
                username,
                style: const TextStyle(
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const UsernameEditPage();
                    },
                  ),
                );
              },
            ),
            const Divider(height: 1),
            _SettingTile(
              title: '利用規約',
              onTap: () {},
            ),
            const Divider(height: 1),
            _SettingTile(
              title: 'プライバシーポリシー',
              onTap: () {},
            ),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingTile({
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(child: Text(title)),
            if (trailing != null) ...[
              trailing!,
              const SizedBox(width: 8),
            ],
            Icon(
              Icons.chevron_right,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:settings_ui/settings_ui.dart';
// import 'package:app/provider/user_notifier.dart';

// class SettingPage extends ConsumerWidget {
//   const SettingPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userState = ref.watch(userNotifierProvider);
//     final username = userState.when(
//       data: (user) => user?.username ?? '名無し',
//       loading: () => '名無し',
//       error: (_, __) => '名無し',
//     );

//     return Scaffold(
//       backgroundColor: Colors.orange,
//       appBar: AppBar(
//         title: const Text('設定'),
//         backgroundColor: Colors.orange,
//         elevation: 0,
//         foregroundColor: Colors.black,
//       ),
//       body: SettingsList(
//         lightTheme: const SettingsThemeData(
//           settingsListBackground: Colors.orange,
//           tileHighlightColor: Colors.transparent,
//         ),
//         sections: [
//           SettingsSection(
//             tiles: [
//               SettingsTile.navigation(
//                 title: Row(
//                   children: [
//                     const Text('ニックネーム'),
//                     Spacer(),
//                     Text(
//                       username,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 onPressed: (context) {},
//               ),
//             ],
//           ),
//           SettingsSection(
//             tiles: [
//               SettingsTile.navigation(
//                 title: const Text('利用規約'),
//                 onPressed: (context) {},
//               ),
//               SettingsTile.navigation(
//                 title: const Text('プライバシーポリシー'),
//                 onPressed: (context) {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
