import 'package:app/constants/app_colors.dart';
import 'package:app/page/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'all_favor_list.dart';
import 'ranking_favor_list.dart';

final StateProvider<int> allRankProvider = StateProvider((ref) {
  return 0;
});

class SharePage extends ConsumerWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int topBarIndex = ref.watch(allRankProvider);
    final Color topBarColor = [AppColors.primary, AppColors.secondary][topBarIndex];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          title: Stack(
            children: [
              Column(children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "みんなの恩返し",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color:AppColors.iconGrey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 30,
                      color: AppColors.iconGrey,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const SettingPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'みんなの恩'),
              Tab(text: 'ランキング'),
            ],
            labelColor: topBarColor,
            indicatorColor: topBarColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: topBarColor),
              insets: EdgeInsets.symmetric(horizontal: 90),
            ),
            onTap: (index) {
              ref.read(allRankProvider.notifier).state = index;
            },
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            AllFavorList(),
            RankingFavorList(),
          ],
        ),
      ),
    );
  }
}
