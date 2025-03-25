import 'package:app/component/error_page.dart';
import 'package:app/page/loading/loading_page.dart';
import 'package:app/page/navigation_root/navigation_root.dart';
import 'package:app/page/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_paging_utils/theme_extension.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingPage(),
        '/root': (context) => NavigationRoot(),
        '/settings': (context) => SettingPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        extensions: [
          PagingHelperViewTheme(
            errorViewBuilder:
                (context, error, stackTrace, onRefreshButtonPressed) =>
                    ErrorView(
              err: error,
              stack: stackTrace,
              refreshCallback: onRefreshButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
